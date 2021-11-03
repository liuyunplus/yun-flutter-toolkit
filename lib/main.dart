import 'package:flutter/material.dart';
import 'package:yun_flutter_component/page/avatar_upload_page.dart';
import 'package:yun_flutter_component/page/card_item_list_page.dart';
import 'package:yun_flutter_component/page/float_box_widget_page.dart';
import 'package:yun_flutter_component/test/test_page2.dart';
import 'package:yun_flutter_component/test/test_page1.dart';
import 'package:yun_flutter_component/page/tag_choice_page.dart';
import 'package:yun_flutter_component/page/image_upload_page.dart';
import 'package:yun_flutter_component/test/test_page3.dart';
import 'package:yun_flutter_component/test/test_page4.dart';
import 'package:yun_flutter_component/test/test_page5.dart';
import 'package:yun_flutter_component/utils/navigator_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false
    );
  }

}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text("Flutter组件列表"),
        backgroundColor: Colors.teal
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getTextButton("九宫格图片组件", ImageUploadPage()),
              _getTextButton("标签选择组件", TagChoicePage()),
              _getTextButton("头像上传组件", AvatarUploadPage()),
              _getTextButton("卡片列表组件", CardItemListPage()),
              _getTextButton("滑动滑块组件", FloatBoxWidgetPage()),
              _getTextButton("测试组件1", TestPage1()),
              _getTextButton("测试组件2", TestPage2()),
              _getTextButton("测试组件3", TestPage3()),
              _getTextButton("测试组件4", TestPage4()),
              _getTextButton("测试组件5", TestPage5()),
            ],
          ),
        )
      )
    );
  }

  Widget _getTextButton(String title, Widget page) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.teal,
        fixedSize: Size(200, 35)
      ),
      child: Text(title, style: TextStyle(color: Colors.white)),
      onPressed: () {
        NavigatorUtil.push(context, page);
      },
    );
  }

}
