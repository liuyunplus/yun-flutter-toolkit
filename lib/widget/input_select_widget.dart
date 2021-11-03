import 'package:flutter/material.dart';

class InputSelectWidget extends StatefulWidget {

  late String title;
  late double titleSize;
  late Color titleColor;
  late double titleAreaWidth;
  String? hintText;
  late double hintTextSize;
  String? content;
  late double contentSize;
  late double maxHeight;
  Widget? tailing;
  Function()? onTap;
  late int inputType;
  List<Widget> Function()? menuBuilder;

  InputSelectWidget({
    required String title,
    double titleSize = 16,
    Color titleColor = Colors.black87,
    double titleAreaWidth = 80,
    String? hintText,
    double hintTextSize = 15,
    String? content,
    double contentSize = 16,
    double maxHeight = 300,
    Widget? tailing,
    Function()? onTap,
    int inputType = 1,
    List<Widget> Function()? menuBuilder
  }) {
    this.title = title;
    this.titleSize = titleSize;
    this.titleColor = titleColor;
    this.titleAreaWidth = titleAreaWidth;
    this.hintText = hintText;
    this.hintTextSize = hintTextSize;
    this.content = content;
    this.contentSize = contentSize;
    this.maxHeight = maxHeight;
    this.tailing = tailing;
    this.onTap = onTap;
    this.inputType = inputType;
    this.menuBuilder = menuBuilder;
  }

  @override
  State<StatefulWidget> createState() => _InputSelectWidgetState();

}

class _InputSelectWidgetState extends State<InputSelectWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        color: Colors.white,
        child: IntrinsicHeight(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      width: widget.titleAreaWidth,
                      alignment: Alignment.centerLeft,
                      child: Text(widget.title, style: TextStyle(fontSize: widget.titleSize, color: widget.titleColor))
                  ),
                  Expanded(
                      child: widget.inputType == 1 ? _buildTextInput() : _buildSelectInput()
                  )
                ]
            )
        )
    );
  }

  Widget _getContentText() {
    if (widget.content == null) {
      return Text(widget.hintText??"", style: TextStyle(fontSize: widget.hintTextSize, color: Colors.grey));
    }
    return Text(widget.content??"", style: TextStyle(fontSize: widget.contentSize));
  }

  Widget _buildTextInput() {
    return TextField(
      maxLines: 1,
      decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: widget.hintTextSize, color: Colors.grey),
          contentPadding: EdgeInsets.only(top: 15, bottom: 15),
          isDense: true
      ),
      style: TextStyle(fontSize: widget.titleSize),
      cursorHeight: 22,
      cursorWidth: 1.2,
      cursorColor: Colors.black87,
    );
  }

  Widget _buildSelectInput() {
    return GestureDetector(
        child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            color: Colors.white,
            alignment: Alignment.centerRight,
            child: Row(
                children: [
                  Text("", style: TextStyle(fontSize: widget.contentSize)),
                  _getContentText(),
                  Spacer(),
                  widget.tailing??Text("")
                ]
            )
        ),
        onTap: widget.onTap != null ? widget.onTap : () {
          showSelectMenu();
        }
    );
  }

  void showSelectMenu() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(
              maxHeight: widget.maxHeight
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: widget.menuBuilder!()
            )
          )
        );
      }
    );
  }

}