import 'package:flutter/material.dart';
import 'package:yun_flutter_component/widget/float_box_widget.dart';

class FloatBoxWidgetPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _FloatBoxWidgetPageState();

}

class _FloatBoxWidgetPageState extends State<FloatBoxWidgetPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text("滑动滑块组件"),
        backgroundColor: Colors.teal
      ),
      body: _buildBody(context)
    );
  }

  Widget _buildBody(BuildContext context) {
    return FloatBoxWidget(backEnd: _box1(), frontEnd: _box2());
  }

  Widget _box1() {
    return Column(
      children: [
        Container(
          width: 400,
          height: 200,
          color: Colors.red,
        ),
        Container(
          width: 400,
          height: 200,
          color: Colors.green,
        )
      ],
    );
  }

  Widget _box2() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.blue,
    );
  }

}