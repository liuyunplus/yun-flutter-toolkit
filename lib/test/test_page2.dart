import 'package:flutter/material.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';
import 'package:yun_flutter_component/utils/icon_util.dart';

class TestPage2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestPage2State();

}

class _TestPage2State extends State<TestPage2> with SingleTickerProviderStateMixin {

  double topHeight = 250;
  Color topBgColor = Colors.blue;
  bool hasFold = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     toolbarHeight: 40,
        //     title: Text("测试页面2"),
        //     backgroundColor: Colors.teal
        // ),
        backgroundColor: ColorsUtil.hexColor(0xEFEFEF),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        AnimatedContainer(
          width: double.infinity,
          height: topHeight,
          color: topBgColor,
          duration: Duration(milliseconds: 300),
          child:  Container(),
        ),
        Stack(
          children: [
            Container(
              height: 40,
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              child: Text("我的活动", style: TextStyle(fontSize: 16)),
            ),
            Positioned(
              child: GestureDetector(
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Icon(this.hasFold ? IconUtil.xiangshang : IconUtil.xiangxia)
                ),
                onPanUpdate: (DragUpdateDetails details) {
                  if (details.delta.dy > 0) {
                    this.topHeight = 250;
                    hasFold = true;
                    topBgColor = Colors.blue;
                  }
                  if (details.delta.dy < 0) {
                    this.topHeight = MediaQuery.of(context).padding.top;
                    hasFold = false;
                    topBgColor = Colors.white;
                  }
                  setState(() {});
                }
              )
            )
          ],
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.green,
          )
        )
      ]
    );
  }

}