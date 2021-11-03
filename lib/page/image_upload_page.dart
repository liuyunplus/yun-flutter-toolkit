import 'package:flutter/material.dart';
import 'package:yun_flutter_component/widget/multi_image_select_widget.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text("图片上传组件"),
            backgroundColor: Colors.teal
        ),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            alignment: Alignment.centerLeft,
            child: Text("九张图片", style: TextStyle(fontSize: 16)),
            color: Colors.white,
          ),
          Container(
            alignment: Alignment.centerLeft,
            color: Colors.grey,
            child: MultiImageSelectWidget(maxNum: 9, lineItemNum: 3)
          )
        ]
      )
    );
  }

}
