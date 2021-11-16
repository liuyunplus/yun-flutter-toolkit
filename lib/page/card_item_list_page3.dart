import 'package:flutter/material.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';
import 'package:yun_flutter_component/utils/icon_util.dart';

class CardItemListPage3 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CardItemListPage3State();

}

class _CardItemListPage3State extends State<CardItemListPage3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text("卡片列表页面3"),
            backgroundColor: Colors.teal
        ),
        backgroundColor: ColorsUtil.hexColor(0xEFEFEF),
        body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 10);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 140,
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 5),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image.network(_getImage(index), fit: BoxFit.cover)
              ),
            ),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white
                    ),
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("周末剧本杀活动哈哈哈哈哈哈哈哈哈哈哈哈", maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(IconUtil.shijian, size: 14),
                              Text("10/23 8:00", style: TextStyle(fontSize: 13, color: Colors.black87)),
                              Spacer(),
                              Icon(IconUtil.didian, size: 14),
                              Text("上海长宁", style: TextStyle(fontSize: 13, color: Colors.black87)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                child: Text("8/16人"),
                                padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.orange,
                                ),
                              ),
                              Spacer(),
                              Container(
                                child: Text("报名中"),
                                padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.green,
                                ),
                              )
                            ],
                          ),
                        ]
                    )
                )
            ),
            // Container(
            //   width: 20,
            //   alignment: Alignment.center,
            //   child: Icon(Icons.arrow_forward_ios_outlined, size: 12),
            // )
          ]
        )
      )
    );
  }

  String _getImage(int index) {
    if (index == 1 || index == 3 || index == 5) {
      return "https://pic.netbian.com/uploads/allimg/210810/231712-1628608632f5e9.jpg";
    }
    if (index == 2) {
      return "https://vivid-meetup.oss-cn-shanghai.aliyuncs.com/8b20f3d066b04337b397dcefaa62cd0b.jpg";
    }
    if (index == 4) {
      return "https://vivid-meetup.oss-cn-shanghai.aliyuncs.com/2bbcff931be444bf8b147c00f5dad838.jpg";
    }
    return "https://vivid-meetup.oss-cn-shanghai.aliyuncs.com/61f0d5217bd642b4b207bf1616579f2a.jpg";
  }

}