import 'package:flutter/material.dart';
import 'package:yun_flutter_component/page/avatar_upload_page.dart';
import 'package:yun_flutter_component/page/card_item_list_page.dart';
import 'package:yun_flutter_component/page/tag_choice_page.dart';
import 'package:yun_flutter_component/page/image_upload_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/ImageUploadPage": (context) => ImageUploadPage(),
        "/ChoiceChipPage": (context) => TagChoicePage(),
        "/AvatarUploadPage": (context) => AvatarUploadPage(),
        "/CardItemListPage": (context) => CardItemListPage(),
      }
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getTextButton("九宫格图片上传组件", "/ImageUploadPage"),
              _getTextButton("标签选择组件", "/ChoiceChipPage"),
              _getTextButton("头像上传组件", "/AvatarUploadPage"),
              _getTextButton("卡片列表组件", "/CardItemListPage"),
              _getTextButton("组件5", "/TestPage"),
              _getTextButton("组件6", "/TestPage"),
              _getTextButton("组件7", "/TestPage"),
              _getTextButton("组件8", "/TestPage"),
              _getTextButton("组件9", "/TestPage"),
              _getTextButton("组件10", "/TestPage"),
              _getTextButton("组件11", "/TestPage"),
              _getTextButton("组件12", "/TestPage"),
              _getTextButton("组件13", "/TestPage"),
              _getTextButton("组件15", "/TestPage"),
              _getTextButton("组件16", "/TestPage"),
              _getTextButton("组件17", "/TestPage"),
              _getTextButton("组件18", "/TestPage"),
              _getTextButton("组件19", "/TestPage"),
              _getTextButton("组件20", "/TestPage"),
            ],
          ),
        )
      )
    );
  }

  Widget _getTextButton(String title, String linkPage) {
    return TextButton(
      child: Text(title),
      onPressed: () {
        Navigator.pushNamed(context, linkPage, arguments: {"title": title});
      },
    );
  }

}
