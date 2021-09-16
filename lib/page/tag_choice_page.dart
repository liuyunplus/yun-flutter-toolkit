import 'package:flutter/material.dart';
import 'package:yun_flutter_component/component/tag_choice_widget.dart';


class TagChoicePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TagChoicePageState();
  }

}

class _TagChoicePageState extends State<TagChoicePage> {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> params = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text(params["title"]),
            backgroundColor: Colors.teal
        ),
        body: buildBody()
    );
  }

  Widget buildBody() {
    List<String> list = ["四度空间", "受到广泛", "对方尴尬", "瑞特"];
    // Map<String, String> map = {
    //   "0": "报BUG",
    //   "1": "界面设计",
    //   "2": "功能设计",
    //   "3": "业务运营",
    //   "4": "点个赞",
    //   "5": "吐下槽"
    // };
    TagChoiceWidget<String> chipWidget = TagChoiceWidget(itemList: list);
    return Column(
      children: <Widget>[
        chipWidget,
        RaisedButton(
          child: Text('Button'),
          onPressed: (){
            String s = chipWidget.getSelected();
            print(s);
          },
        )
      ],
    );
  }

}