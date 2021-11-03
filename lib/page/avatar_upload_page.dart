import 'package:flutter/material.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';
import 'package:yun_flutter_component/widget/avatar_upload_widget.dart';

class AvatarUploadPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AvatarUploadPageState();

}

class _AvatarUploadPageState extends State<AvatarUploadPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text("头像上传组件"),
            backgroundColor: Colors.teal
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: AvatarUploadWidget(imageUrl: "https://pic.netbian.com/uploads/allimg/210810/231712-1628608632f5e9.jpg", isCircle: false)
        ),
        backgroundColor: ColorsUtil.hexColor(0xEFEFEF)
    );
  }

}
