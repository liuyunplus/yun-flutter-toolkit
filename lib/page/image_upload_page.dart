import 'package:flutter/material.dart';
import 'package:yun_flutter_component/widget/image_upload_widget.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> params = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text(params["title"]),
            backgroundColor: Colors.teal
        ),
        body: ImageUploadWidget(maxNum: 3, needCompress: true)
    );
  }

}
