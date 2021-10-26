import 'package:flutter/material.dart';

class MyTestPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MyTestPageState();

}

class _MyTestPageState extends State<MyTestPage> with SingleTickerProviderStateMixin {

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
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.blue,
              ),
          )
        ];
      },
      body: Container(
        height: 200,
        color: Colors.green,
        child: Text("测试一下"),
      ),
    );
  }

}

class UnitPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      alignment: Alignment.center,
      color: Colors.orangeAccent,
      child: Text("ahahha", style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

}