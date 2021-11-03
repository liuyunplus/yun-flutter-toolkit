import 'package:flutter/material.dart';

enum InputType {
  TextInput, BottomModal
}

const Color black65 = Color(0xA5000000);

class InputSelectWidget extends StatefulWidget {

  late String title;
  late double titleSize;
  late Color titleColor;
  late double titleAreaWidth;
  late bool required;
  String? hintText;
  late double hintTextSize;
  String? content;
  late double contentSize;
  late double maxModalHeight;
  Widget? tailing;
  Function()? onTap;
  late InputType inputType;
  late bool modalDismissible;
  Widget Function()? modalBuilder;
  TextEditingController? controller;

  InputSelectWidget({
    required String title,
    double titleSize = 16,
    Color titleColor = black65,
    double titleAreaWidth = 80,
    bool required = false,
    String? hintText,
    double hintTextSize = 15,
    String? content,
    double contentSize = 16,
    double maxModalHeight = 500,
    Widget? tailing,
    Function()? onTap,
    InputType inputType = InputType.TextInput,
    bool modalDismissible = true,
    Widget Function()? modalBuilder,
    TextEditingController? controller
  }) {
    this.title = title;
    this.titleSize = titleSize;
    this.titleColor = titleColor;
    this.titleAreaWidth = titleAreaWidth;
    this.required = required;
    this.hintText = hintText;
    this.hintTextSize = hintTextSize;
    this.content = content;
    this.contentSize = contentSize;
    this.maxModalHeight = maxModalHeight;
    this.tailing = tailing;
    this.onTap = onTap;
    this.inputType = inputType;
    this.modalDismissible = modalDismissible;
    this.modalBuilder = modalBuilder;
    this.controller = controller;
  }

  @override
  State<StatefulWidget> createState() => _InputSelectWidgetState();

}

class _InputSelectWidgetState extends State<InputSelectWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        color: Colors.white,
        child: IntrinsicHeight(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      width: widget.titleAreaWidth,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(widget.title, style: TextStyle(fontSize: widget.titleSize, color: widget.titleColor)),
                          Text(widget.required?" *":"", style: TextStyle(fontSize: widget.titleSize, color: Colors.red))
                        ],
                      )
                  ),
                  Expanded(
                      child: widget.inputType == InputType.TextInput ? _buildTextInput() : _buildBottomModal()
                  )
                ]
            )
        )
    );
  }

  Widget _getContentText() {
    String text;
    TextStyle style;
    if (widget.content == null) {
      text = widget.hintText??"";
      style = TextStyle(fontSize: widget.hintTextSize, color: Colors.grey);
    } else {
      text = widget.content??"";
      style = TextStyle(fontSize: widget.contentSize);
    }
    return Expanded(
      child: Text(text, overflow: TextOverflow.ellipsis, style: style),
    );
  }

  Widget _buildTextInput() {
    return TextField(
      controller: widget.controller,
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

  Widget _buildBottomModal() {
    return GestureDetector(
        child: Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            color: Colors.white,
            alignment: Alignment.centerRight,
            child: Row(
                children: [
                  Text("", style: TextStyle(fontSize: widget.contentSize)),
                  _getContentText(),
                  widget.tailing??Text("")
                ]
            )
        ),
        onTap: widget.onTap != null ? widget.onTap : () {
          showBottomModal();
        }
    );
  }

  void showBottomModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: widget.modalDismissible,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
            constraints: BoxConstraints(
                maxHeight: widget.maxModalHeight
            ),
            child: widget.modalBuilder!()
        );
      }
    );
  }

}