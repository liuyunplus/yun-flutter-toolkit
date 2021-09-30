import 'package:flutter/material.dart';
import 'package:yun_flutter_component/utils/toast_util.dart';
import 'package:yun_flutter_component/widget/avatar_upload_widget.dart';

class AvatarUploadPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AvatarUploadPageState();

}

class _AvatarUploadPageState extends State<AvatarUploadPage> {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> params = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text(params["title"]),
            backgroundColor: Colors.teal,
            actions: [
              IconButton(
                onPressed: () {
                  ToastUtil.showToast("刘运你哈呀");
                },
                icon: Icon(Icons.settings)
              )
            ],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: AvatarUploadWidget(imageUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg", isCircle: false)
        ),
        // backgroundColor: Colors.grey[300]
    );
  }

}
