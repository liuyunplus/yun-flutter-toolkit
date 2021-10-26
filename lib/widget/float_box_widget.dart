import 'package:flutter/material.dart';

typedef WidgetBuilder = Widget Function(GlobalKey childKey);

class FloatBoxWidget extends StatefulWidget {

  late Offset offset;
  late Widget frontEnd;
  late Widget backEnd;

  FloatBoxWidget({
    double initX = 0,
    double initY = 0,
    required Widget frontEnd,
    required Widget backEnd,
  }) {
    this.offset = Offset(initX, initY);
    this.frontEnd = frontEnd;
    this.backEnd = backEnd;
  }

  @override
  State<StatefulWidget> createState() => _FloatBoxWidgetState();

}

class _FloatBoxWidgetState extends State<FloatBoxWidget> {

  GlobalKey childKey = GlobalKey();
  GlobalKey parentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
        key: parentKey,
        fit: StackFit.passthrough,
        children: <Widget>[
          widget.backEnd,
          _buildFrontEnd()
        ]
    );
  }

  Widget _buildFrontEnd() {
    return  Positioned(
        left: widget.offset.dx,
        top: widget.offset.dy,
        child: GestureDetector(
            key: childKey,
            child: widget.frontEnd,
            onPanUpdate: (detail) {
              BuildContext buildContext1 = this.parentKey.currentContext!;
              BuildContext buildContext2 = this.childKey.currentContext!;
              setState(() {
                widget.offset = _calOffset(buildContext1.size!, buildContext2.size!, widget.offset, detail.delta);
              });
            }
        )
    );
  }

  Offset _calOffset(Size parentSize, Size childSize, Offset currentOffset, Offset moveOffset) {
    double dx = _calOffsetX(parentSize, childSize, currentOffset, moveOffset);
    double dy = _calOffsetY(parentSize, childSize, currentOffset, moveOffset);
    return Offset(dx, dy);
  }

  double _calOffsetX(Size parentSize, Size childSize, Offset currentOffset, Offset moveOffset) {
    //水平偏移量不能小于0
    if (currentOffset.dx + moveOffset.dx <= 0) {
      return 0;
    }
    //水平偏移量不能大于屏幕最大宽度
    if (currentOffset.dx + moveOffset.dx + childSize.width >= parentSize.width) {
      return parentSize.width - childSize.width;
    }
    return currentOffset.dx + moveOffset.dx;
  }

  double _calOffsetY(Size parentSize, Size childSize, Offset currentOffset, Offset moveOffset) {
    //垂直偏移量不能小于0
    if (currentOffset.dy + moveOffset.dy <= 0) {
      return 0;
    }
    //垂直偏移量不能大于屏幕最大高度
    if (currentOffset.dy + moveOffset.dy + childSize.height >= parentSize.height) {
      return parentSize.height - childSize.height;
    }
    return currentOffset.dy + moveOffset.dy;
  }

}