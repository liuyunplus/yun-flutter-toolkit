import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';

class TestPage4 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestPage4State();

}

class _TestPage4State extends State<TestPage4> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text("测试页面4"),
            backgroundColor: Colors.teal
        ),
        backgroundColor: ColorsUtil.hexColor(0xEFEFEF),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Container(
      height: 400,
      width: double.infinity,
      child: WebView(
        initialUrl: 'http://172.16.60.147:8080/',
        javascriptMode: JavascriptMode.unrestricted,
      )
    );

  }

}