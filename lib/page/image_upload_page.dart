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
        body: MultiImageSelectWidget(maxNum: 3)
    );
  }

}
