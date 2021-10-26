import 'package:flutter/material.dart';
import 'package:yun_flutter_component/widget/tag_choice_widget.dart';


class TagChoicePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _TagChoicePageState();
  }

}

class _TagChoicePageState extends State<TagChoicePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            centerTitle: true,
            title: Text("标签选择组件"),
            backgroundColor: Color.fromRGBO(22, 186, 152, 1),
            // elevation: 0,
        ),
        body: buildBody(),
        backgroundColor: Color.fromRGBO(245, 246, 248, 1),
    );
  }

  Widget buildBody() {
    List<String> list = ["四度空间", "受到广泛", "对方尴尬", "瑞特"];
    TagChoiceWidget<String> chipWidget = TagChoiceWidget(itemList: list);
    return Column(
      children: <Widget>[
        chipWidget,
        RaisedButton(
          child: Text('Button'),
          color: Color.fromRGBO(255, 255, 255, 1),
          onPressed: (){
            String s = chipWidget.getSelected();
            print(s);
          },
        ),
        SizedBox(height: 10),
        Container(
          height: 40,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Text("刘运"),
        ),
        Container(
          height: 40,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: Color.fromRGBO(255, 255, 255, 1),
          child: Text("哈哈"),
        )
      ],
    );
  }

}