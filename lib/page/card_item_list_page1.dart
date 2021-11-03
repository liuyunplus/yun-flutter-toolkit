import 'package:flutter/material.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';
import 'package:yun_flutter_component/widget/card_item_list_widget.dart';

class CardItemListPage1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CardItemListPage1State();

}

class _CardItemListPage1State extends State<CardItemListPage1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text("卡片列表页面1"),
        backgroundColor: Colors.teal
      ),
      body: _buildBody(),
      backgroundColor: ColorsUtil.hexColor(0xEFEFEF)
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
            children: [
              CardItemListWidget(img: "https://pic.netbian.com/uploads/allimg/210810/231712-1628608632f5e9.jpg", title: "哈哈哈", address: "中国上海"),
              CardItemListWidget(img: "https://pic.netbian.com/uploads/allimg/210810/231712-1628608632f5e9.jpg", title: "哈哈哈", address: "中国上海"),
              CardItemListWidget(img: "https://pic.netbian.com/uploads/allimg/210810/231712-1628608632f5e9.jpg", title: "哈哈哈", address: "中国上海"),
              CardItemListWidget(img: "https://pic.netbian.com/uploads/allimg/210810/231712-1628608632f5e9.jpg", title: "哈哈哈", address: "中国上海"),
              CardItemListWidget(img: "https://pic.netbian.com/uploads/allimg/210810/231712-1628608632f5e9.jpg", title: "哈哈哈", address: "中国上海"),
            ]
        )
      )
    );
  }

}