import 'package:flutter/material.dart';

/// 页面导航
class NavigatorUtil {

  static void push(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }

}
