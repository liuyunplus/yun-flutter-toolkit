import 'package:flutter/material.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';
import 'package:yun_flutter_component/utils/icon_util.dart';

class SettingPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SettingPageState();

}

class _SettingPageState extends State<SettingPage> {

  late String text;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text("设置页面"),
            backgroundColor: Colors.teal
        ),
        backgroundColor: ColorsUtil.hexColor(0xEFEFEF),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        SizedBox(height: 10),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            color: Colors.white,
            child: Row(
              children: [
                Icon(IconUtil.duoyuyan, size: 18),
                SizedBox(width: 5),
                Text("系统语言"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined, size: 12)
              ]
            )
          ),
          onTap: () {
            print("系统语言");
          }
        ),
        Divider(height: 0.1, color: Colors.grey),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            color: Colors.white,
            child: Row(
              children: [
                Icon(IconUtil.yanse, size: 18),
                SizedBox(width: 5),
                Text("主题颜色"),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined, size: 12)
              ]
            )
          ),
          onTap: () {
            print("主题颜色");
          }
        ),
        Divider(height: 0.1, color: Colors.grey),
        GestureDetector(
            child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 40,
                color: Colors.white,
                child: Row(
                    children: [
                      Icon(IconUtil.nichen, size: 18),
                      SizedBox(width: 5),
                      Text("用户昵称"),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined, size: 12)
                    ]
                )
            ),
            onTap: () {
              print("用户昵称");
            }
        ),
        Divider(height: 0.05, color: Colors.grey),
        GestureDetector(
            child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                height: 40,
                color: Colors.white,
                child: Row(
                    children: [
                      Icon(IconUtil.shouji, size: 18),
                      SizedBox(width: 5),
                      Text("手机号码"),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_outlined, size: 12)
                    ]
                )
            ),
            onTap: () {
              print("手机号码");
            }
        ),
        SizedBox(height: 10),
        GestureDetector(
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 40,
              color: Colors.white,
              child: Text("退出登录")
          ),
          onTap: () {
            print("退出登录");
          }
        ),
      ],
    );
  }

}