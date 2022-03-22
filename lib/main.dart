import 'package:flutter/material.dart';
import 'package:yun_flutter_component/page/avatar_upload_page.dart';
import 'package:yun_flutter_component/page/card_item_list_page1.dart';
import 'package:yun_flutter_component/page/card_item_list_page2.dart';
import 'package:yun_flutter_component/page/card_item_list_page3.dart';
import 'package:yun_flutter_component/page/form_page.dart';
import 'package:yun_flutter_component/page/image_upload_page.dart';
import 'package:yun_flutter_component/page/setting_page.dart';
import 'package:yun_flutter_component/task/feedback_list_page.dart';
import 'package:yun_flutter_component/test/test_page2.dart';
import 'package:yun_flutter_component/test/test_page3.dart';
import 'package:yun_flutter_component/test/test_page4.dart';
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
            children: [
              _getTextButton("九宫格图片组件", ImageUploadPage()),
              _getTextButton("卡片列表页面1", CardItemListPage1()),
              _getTextButton("卡片列表页面2", CardItemListPage2()),
              _getTextButton("卡片列表页面3", CardItemListPage3()),
              _getTextButton("头像上传组件", AvatarUploadPage()),
              _getTextButton("设置页面", SettingPage()),
              _getTextButton("表单组件页面", FormPage()),
              _getTextButton("测试页面2", TestPage2()),
              _getTextButton("测试页面3", TestPage3()),
              _getTextButton("测试页面4", TestPage4()),
              _getTextButton("测试页面5", FeedbackListPage()),
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
        fixedSize: Size(200, 35),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20)
      ),
      child: Text(title, style: TextStyle(color: Colors.white)),
      onPressed: () {
        NavigatorUtil.push(context, page);
      },
    );
  }

}
