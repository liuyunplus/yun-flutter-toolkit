import 'package:flutter/material.dart';
import 'package:yun_flutter_component/utils/tab_size_indicator.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';

class TestPage3 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestPage3State();

}

class _TestPage3State extends State<TestPage3> with TickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 40,
          title: Text("测试页面3"),
          backgroundColor: Colors.teal
      ),
      backgroundColor: ColorsUtil.hexColor(0xEFEFEF),
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return TabBar(
        controller: tabController,
        labelPadding: EdgeInsets.zero,
        indicator: TabSizeIndicator(
          borderSide: BorderSide(width: 3, color: Colors.green),
          wantWidth: 40
        ),
        tabs: [
          Container(
            width: double.infinity,
            height: 35,
            alignment: Alignment.center,
            child: Text("data1", style: TextStyle(color: Colors.black87)),
            color: Colors.white,
          ),
          Container(
            width: double.infinity,
            height: 35,
            alignment: Alignment.center,
            child: Text("data2", style: TextStyle(color: Colors.black87)),
            color: Colors.white,
          ),
          Container(
            width: double.infinity,
            height: 35,
            alignment: Alignment.center,
            child: Text("data3", style: TextStyle(color: Colors.black87)),
            color: Colors.white,
          ),
        ]
    );
  }

}