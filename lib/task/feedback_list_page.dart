import 'package:flutter/material.dart';
import 'package:yun_flutter_component/task/my_feedback.dart';
import 'feedback_service.dart';

class FeedbackListPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _FeedbackListPageState();

}

class _FeedbackListPageState extends State<FeedbackListPage> {

  List<MyFeedback>? list;

  @override
  Future<void> initState() async {
    list = await FeedbackService.getMyFeedbackLIst();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return Container();
    }
    return Container(
      width: 1300,
      child: PaginatedDataTable(
        header: Text("反馈列表"),
        source: MyDataTableSource(list!),
        columns: [
          DataColumn(label: Text('汽车ID')),
          DataColumn(label: Text('用户ID')),
          DataColumn(label: Text('反馈类型')),
          DataColumn(label: Text('反馈内容')),
          DataColumn(label: Text('创建者昵称')),
          DataColumn(label: Text('创建者类型')),
          DataColumn(label: Text('父级ID')),
          DataColumn(label: Text('创建时间'))
        ],
      )
    );
  }

}

class MyDataTableSource extends DataTableSource {

  final List<MyFeedback> data;

  MyDataTableSource(this.data);

  @override
  DataRow? getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text('${data[index].carId}')),
        DataCell(Text('${data[index].userId}')),
        DataCell(Text('${data[index].category}')),
        DataCell(Text('${data[index].content}')),
        DataCell(Text('${data[index].creatorNick}')),
        DataCell(Text('${data[index].creatorType}')),
        DataCell(Text('${data[index].parentId}')),
        DataCell(Text('${data[index].created}')),
      ]
    );
  }

  @override
  int get selectedRowCount {
    return 0;
  }

  @override
  bool get isRowCountApproximate {
    return false;
  }

  @override
  int get rowCount {
    return data.length;
  }

}