import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';
import 'package:yun_flutter_component/utils/date_util.dart';
import 'package:yun_flutter_component/utils/icon_util.dart';
import 'package:yun_flutter_component/widget/input_select_widget.dart';

class FormPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _FormPageState();

}

class _FormPageState extends State<FormPage> {

  SelectItem? selected;
  DateTime? startTime;
  DateTime? endTime;

  List<SelectItem> itemList = [
    SelectItem("1", "上海游泳队"),
    SelectItem("2", "长宁剧本杀"),
    SelectItem("3", "国家围棋队1"),
    SelectItem("4", "国家围棋队2"),
    SelectItem("5", "国家围棋队3"),
    SelectItem("6", "国家围棋队4"),
    SelectItem("7", "国家围棋队5"),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(
              toolbarHeight: 40,
              title: Text("测试组件5"),
              backgroundColor: Colors.teal
          ),
          backgroundColor: ColorsUtil.hexColor(0xEFEFEF),
          body: _buildBody()
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      }
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
            children: [
              InputSelectWidget(
                title: "姓名",
                titleAreaWidth: 120,
                hintText: "请输入姓名",
                required: true
              ),
              Divider(height: 1, color: Colors.grey),
              InputSelectWidget(
                title: "性别",
                titleAreaWidth: 120,
                hintText: "请输入性别",
                required: true
              ),
              Divider(height: 1, color: Colors.grey),
              InputSelectWidget(
                  title: "手机号",
                  titleAreaWidth: 120,
                  hintText: "请输入手机号"
              ),
              Divider(height: 1, color: Colors.grey),
              InputSelectWidget(
                  title: "身份证",
                  titleAreaWidth: 120,
                  hintText: "请输入身份证"
              ),
              Divider(height: 1, color: Colors.grey),
              InputSelectWidget(
                  title: '选择群组',
                  titleAreaWidth: 120,
                  hintText: "请选择群组",
                  content: selected == null ? null : selected!.value,
                  tailing: Icon(Icons.arrow_forward_ios_outlined, size: 12),
                  modalBuilder: this._buildGroupList,
                  inputType: InputType.BottomModal
              ),
              Divider(height: 1, color: Colors.grey),
              InputSelectWidget(
                  title: "报名开始时间",
                  titleAreaWidth: 120,
                  hintText: "请选择时间",
                  content: startTime == null ? null : DateUtil.formatDateTime(startTime!, pattern: TIME_FORMAT_PATTERN2),
                  tailing: Icon(IconUtil.rili, size: 18),
                  onTap: startTimeOnTap,
                  inputType: InputType.BottomModal
              ),
              Divider(height: 1, color: Colors.grey),
              InputSelectWidget(
                  title: "报名结束时间",
                  titleAreaWidth: 120,
                  hintText: "请选择时间",
                  content: endTime == null ? null : DateUtil.formatDateTime(endTime!, pattern: TIME_FORMAT_PATTERN2),
                  tailing: Icon(IconUtil.rili, size: 18),
                  onTap: endTimeOnTap,
                  inputType: InputType.BottomModal
                // menuBuilder: this._buildList,
              ),
            ]
        ),
      ),
    );
  }

  Widget _buildGroupList() {
    List<Widget> groupList = [];
    for (SelectItem selectItem in itemList) {
      groupList.add(_buildItem(selectItem));
      groupList.add(Divider(height: 1, color: Colors.grey));
    }
    groupList.removeLast();
    return SingleChildScrollView(
      child: Column(
        children: groupList,
      )
    );
  }

  Widget _buildItem(SelectItem selectItem) {
    return GestureDetector(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          child: Text(selectItem.value, style: TextStyle(fontSize: 16)),
        ),
        onTap: () {
          this.selected = selectItem;
          Navigator.of(context).pop();
          setState(() {});
        }
    );
  }

  void startTimeOnTap() {
    DatePicker.showDatePicker(
        context,
        minDateTime: DateTime.now().add(new Duration(minutes: 10)),
        initialDateTime: DateTime.now().add(new Duration(minutes: 10)),
        dateFormat: "yyyy年-MM月-dd日 H时:m分",
        locale: DateTimePickerLocale.zh_cn,
        pickerMode: DateTimePickerMode.datetime,
        minuteDivider: 1,
        onConfirm: (DateTime dateTime, List<int> index) {
          this.startTime = dateTime;
          setState(() {});
        }
    );
  }

  void endTimeOnTap() {
    DatePicker.showDatePicker(
        context,
        minDateTime: DateTime.now().add(new Duration(minutes: 10)),
        initialDateTime: DateTime.now().add(new Duration(minutes: 10)),
        dateFormat: "yyyy年-MM月-dd日 H时:m分",
        locale: DateTimePickerLocale.zh_cn,
        pickerMode: DateTimePickerMode.datetime,
        minuteDivider: 1,
        onConfirm: (DateTime dateTime, List<int> index) {
          this.endTime = dateTime;
          setState(() {});
        }
    );
  }

}

class SelectItem {

  String key;
  String value;

  SelectItem(this.key, this.value);

}