import 'package:flutter/material.dart';
import 'package:yun_flutter_component/utils/colors_util.dart';

class TestPage1 extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestPage1State();

}

class _TestPage1State extends State<TestPage1> {

  ScrollController _controller = ScrollController();
  double? offset;


  @override
  void initState() {
    super.initState();
    // _controller.addListener(() {
    //   offset = _controller.offset;
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsUtil.hexColor(0xEFEFEF),
        body: _buildBody()
    );
  }

  Widget _buildContainer(offset) {
    // double h = MediaQuery.of(context).padding.top;
    // double h2 = 200 - h;
    if (offset > 260) {
      return Container(
        color: Colors.green,
      );
    }
    return Container(
      // height: 200,
      color: Colors.red,
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      // controller: _controller,
      slivers: [
        SliverLayoutBuilder(
          builder: (BuildContext context, constraints) {
            double offset = constraints.scrollOffset;
            double h2 = constraints.crossAxisExtent;
            double h3 = constraints.overlap;
            double h4 = constraints.cacheOrigin;
            double h5 = constraints.precedingScrollExtent;
            double h6 = constraints.viewportMainAxisExtent;
            bool h7 = constraints.isTight;
            bool h8 = constraints.isNormalized;
            double h9 = constraints.remainingPaintExtent;
            return SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 200,
              toolbarHeight: 0,
              // primary: true,
              flexibleSpace: _buildContainer(offset),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.green,
                  child: Column(
                    children: [
                      Text('位移1：${offset}'),
                      Text('位移2：${h2}'),
                      Text('位移3：${h3}'),
                      Text('位移4：${h4}'),
                      Text('位移5：${h5}'),
                      Text('位移6：${h6}'),
                      Text('123：${h7}'),
                      Text('123：${h8}'),
                      Text('123：${h9}'),
                    ],
                  )
                ),
              ),
            );
          },
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                height: 100,
                color: Colors.grey,
              ),
              Container(
                height: 100,
                color: Colors.white,
              ),
              Container(
                height: 100,
                color: Colors.grey,
              ),
              Container(
                height: 100,
                color: Colors.white,
              ),
              Container(
                height: 100,
                color: Colors.grey,
              ),
              Container(
                height: 100,
                color: Colors.white,
              ),
              Container(
                height: 100,
                color: Colors.grey,
              ),
              Container(
                height: 100,
                color: Colors.white,
              ),
              Container(
                height: 100,
                color: Colors.grey,
              ),
              Container(
                height: 100,
                color: Colors.white,
              ),
            ]
          )
        )
      ]
    );
  }

}