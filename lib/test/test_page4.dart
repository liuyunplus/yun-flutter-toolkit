import 'package:flutter/material.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';

class TestPage4 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestPage4State();

}

class _TestPage4State extends State<TestPage4> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 40,
            title: Text("测试组件4"),
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
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5)
                  ),
                  child: Image.network(_getImage(index), fit: BoxFit.cover)
              ),
            ),
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white
                    ),
                    padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("周末剧本杀活动哈哈哈哈哈哈哈哈哈哈哈哈", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16)),
                          SizedBox(height: 10),
                          Text("时间: 10/23 ~ 10/27", style: TextStyle(fontSize: 13, color: Colors.black87)),
                          SizedBox(height: 5),
                          Text("地点: 上海长宁", style: TextStyle(fontSize: 13, color: Colors.black87)),
                          SizedBox(height: 5),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(fontSize: 13),
                                  children: [
                                    TextSpan(text: "状态: ", style: TextStyle(color: Colors.black87)),
                                    TextSpan(text: "报名中", style: TextStyle(color: Colors.redAccent)),
                                  ]
                              )
                          )
                        ]
                    )
                )
            ),
            Container(
              width: 20,
              alignment: Alignment.center,
              child: Icon(Icons.arrow_forward_ios_outlined, size: 12),
            )
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