import 'package:flutter/material.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';

class TestPage3 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestPage3State();

}

class _TestPage3State extends State<TestPage3> {

  late String text;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text("测试组件3"),
            backgroundColor: Colors.teal
        ),
        backgroundColor: ColorsUtil.hexColor(0xEFEFEF),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SizedBox(height: 10),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            color: Colors.white,
            child: Row(
              children: [
                Text("系统设置"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined, size: 12)
              ]
            )
          ),
          onTap: () {
            print("系统设置");
          }
        ),
        Divider(height: 0.1, color: Colors.grey),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            color: Colors.white,
            child: Row(
              children: [
                Text("账户设置"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined, size: 12)
              ]
            )
          ),
          onTap: () {
            print("账户设置");
          }
        ),
        SizedBox(height: 10),
        GestureDetector(
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 40,
              color: Colors.white,
              child: Text("退出登录")
          ),
          onTap: () {
            print("退出登录");
          }
        ),
      ],
    );
  }

}