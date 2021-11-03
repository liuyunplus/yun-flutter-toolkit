import 'package:flutter/material.dart';

class TestPage1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestPage1State();

}

class _TestPage1State extends State<TestPage1> with SingleTickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text("测试组件1"),
            backgroundColor: Colors.teal
        ),
        body: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 18,
      margin: EdgeInsets.only(top: 10, left: 20),
      child: Text("测试一下", style: TextStyle(fontSize: 14)),
    );
  }

}