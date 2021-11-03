import 'package:drag_container/drag/drag_container.dart';
import 'package:drag_container/drag_container.dart';
import 'package:flutter/material.dart';

class TestPage2 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestPage2State();

}

class _TestPage2State extends State<TestPage2> {

  ///滑动控制器
  ScrollController scrollController = new ScrollController();
  ///抽屉控制器
  DragController dragController = new DragController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text("测试组件2"),
            backgroundColor: Colors.teal
        ),
        backgroundColor: Colors.grey,
        body: _buildBody(context)
    );
  }

  double offset = 0;

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          color: Colors.blue
        ),
        GestureDetector(
          onPanUpdate: (DragUpdateDetails details) {
            this.offset = this.offset + details.delta.dy;
            setState(() {});
          },
          child: Transform.translate(
            offset: Offset(0.0, this.offset),
            child: Container(
              height: 100,
              color: Colors.green,
            ),
          ),
        )
      ],
    );

    // return Transform.translate(
    //   offset: const Offset(0.0, 15.0),
    //   child: Container(
    //     padding: const EdgeInsets.all(8.0),
    //     color: const Color(0xFF7F7F7F),
    //     child: const Text('Quarter'),
    //   ),
    // );
  }

  Widget buildDragWidget(){
    ///层叠布局中的底部对齐
    return Align(
      alignment: Alignment.bottomCenter,
      child: DragContainer(
        ///抽屉关闭时的高度 默认0.4
        initChildRate: 0.8,
        ///抽屉打开时的高度 默认0.4
        maxChildRate: 0.8,
        ///是否显示默认的标题
        isShowHeader: true,
        ///背景颜色
        backGroundColor: Colors.white,
        ///背景圆角大小
        cornerRadius: 12,
        ///自动上滑动或者是下滑的分界值
        maxOffsetDistance:1.5,
        ///抽屉控制器
        controller: dragController,
        ///滑动控制器
        scrollController: scrollController,
        ///自动滑动的时间
        duration: Duration(milliseconds: 800),
        ///抽屉的子Widget
        dragWidget: Container(
          height: 800,
          color: Colors.white,
        ),
        ///抽屉标题点击事件回调
        dragCallBack: (isOpen){
          print("sdfsaf");
        },
      ),
    );
  }

}