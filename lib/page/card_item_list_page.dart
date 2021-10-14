import 'package:flutter/material.dart';
import 'package:yun_flutter_component/widget/card_item_list_widget.dart';

class CardItemListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CardItemListPageState();

}

class _CardItemListPageState extends State<CardItemListPage> {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> params = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(params["title"]),
        backgroundColor: Colors.teal
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: CardItemListWidget(img: "https://avatars3.githubusercontent.com/u/6915570?s=460&v=4", title: "哈哈哈", address: "中国上海")
      ),
      // backgroundColor: Colors.grey[300]
    );
  }

}