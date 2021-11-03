import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';
import 'package:yun_flutter_component/utils/date_util.dart';
import 'package:yun_flutter_component/utils/icon_util.dart';
import 'package:yun_flutter_component/widget/input_select_widget.dart';

class TestPage5 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestPage5State();

}

class _TestPage5State extends State<TestPage5> {

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
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
          children: [
            _buildRow("姓名", "请输入姓名"),
            Divider(height: 1, color: Colors.grey),
            _buildRow("性别", "请输入性别"),
            Divider(height: 1, color: Colors.grey),
            _buildRow("手机号", "请输入手机号"),
            Divider(height: 1, color: Colors.grey),
            InputSelectWidget(
              title: "身份证",
              titleColor: ColorsUtil.hexColor(000000, alpha: 0.65),
              titleAreaWidth: 110,
              hintText: "请输入身份证"
            ),
            Divider(height: 1, color: Colors.grey),
            InputSelectWidget(
              title: '选择群组',
              titleColor: ColorsUtil.hexColor(000000, alpha: 0.65),
              titleAreaWidth: 110,
              hintText: "请选择群组",
              content: selected == null ? null : selected!.value,
              tailing: Icon(Icons.arrow_forward_ios_outlined, size: 12),
              menuBuilder: this._buildList,
              inputType: 2
            ),
            Divider(height: 1, color: Colors.grey),
            InputSelectWidget(
              title: "报名开始时间",
              titleColor: ColorsUtil.hexColor(000000, alpha: 0.65),
              titleAreaWidth: 110,
              hintText: "请选择时间",
              content: selected == null ? null : selected!.value,
              tailing: Icon(IconUtil.rili, size: 18),
              menuBuilder: this._buildList,
              inputType: 2
            ),
            Divider(height: 1, color: Colors.grey),
            InputSelectWidget(
              title: "报名结束时间",
              titleColor: ColorsUtil.hexColor(000000, alpha: 0.65),
              titleAreaWidth: 110,
              hintText: "请选择时间",
              content: time == null ? null : DateUtil.formatDateTime(time!, pattern: TIME_FORMAT_PATTERN2),
              tailing: Icon(IconUtil.rili, size: 18),
              onTap: onTap,
              inputType: 2
              // menuBuilder: this._buildList,
            ),
          ]
      ),
    );
  }

  Widget _buildRow(String title, String hintText) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      color: Colors.white,
      child: IntrinsicHeight(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  width: 110,
                  alignment: Alignment.centerLeft,
                  child: Text(title, style: TextStyle(fontSize: 16, color: ColorsUtil.hexColor(000000, alpha: 0.65)))
              ),
              Expanded(
                  child: TextField(
                    maxLines: 1,
                    decoration: InputDecoration(
                        hintText: hintText,
                        border: InputBorder.none,
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        contentPadding: EdgeInsets.only(top: 15, bottom: 15),
                        // fillColor: Colors.grey[300],
                        // filled: true,
                        isDense: true
                    ),
                    style: TextStyle(fontSize: 16),
                    cursorHeight: 22,
                    cursorWidth: 1.2,
                    cursorColor: Colors.black87,
                  )
              )
            ]
        )
      )
    );
  }

  SelectItem? selected;

  List<SelectItem> itemList = [
    SelectItem("1", "上海游泳队"),
    SelectItem("2", "长宁剧本杀"),
    SelectItem("3", "国家围棋队1"),
    SelectItem("4", "国家围棋队2"),
    SelectItem("5", "国家围棋队3"),
    SelectItem("6", "国家围棋队4"),
    SelectItem("7", "国家围棋队5"),
  ];

  List<Widget> _buildList() {
    List<Widget> list = [];
    for (SelectItem selectItem in itemList) {
      list.add(_buildItem(selectItem));
      list.add(Divider(height: 1, color: Colors.grey));
    }
    list.removeLast();
    return list;
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

  DateTime? time;

  void onTap() {
    DatePicker.showDatePicker(
        context,
        minDateTime: DateTime.now().add(new Duration(minutes: 10)),
        initialDateTime: DateTime.now().add(new Duration(minutes: 10)),
        dateFormat: "yyyy年-MM月-dd日 H时:m分",
        locale: DateTimePickerLocale.zh_cn,
        pickerMode: DateTimePickerMode.datetime,
        minuteDivider: 1,
        onConfirm: (DateTime dateTime, List<int> index) {
          this.time = dateTime;
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