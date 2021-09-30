
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:yun_flutter_component/utils/api_response.dart';

abstract class PageListWidget<T> extends StatefulWidget {

  late _PageListWidgetState<T> _state;

  @override
  State<StatefulWidget> createState() {
    this._state = _PageListWidgetState();
    return this._state;
  }

  @protected
  Widget buildList(PageContext<T> pageContext);

  @protected
  Future<ApiResponse<List<T>>> fetchData(PageContext<T> pageContext);

  @protected
  PageContext<T> initPageContext() {
    return PageContext();
  }

  PageContext<T> getPageContext() {
    return this._state.pageContext;
  }

  List<T> getDataList() {
    return this._state.pageContext.dataList;
  }

  void setPageNo(int pageNo) {
    this._state.pageContext.pageNo = pageNo;
    this._state.pageContext.hasMore = true;
    this._state.pageContext.dataList.clear();
    this._state.fetchData();
  }

  void setPageSize(int pageSize) {
    this._state.pageContext.pageSize = pageSize;
    this._state.pageContext.hasMore = true;
    this._state.pageContext.dataList.clear();
    this._state.fetchData();
  }

  void refresh(List<T> dataList) {
    this._state.setState(() {
      this._state.pageContext.dataList = dataList;
    });
  }

}

class _PageListWidgetState<T> extends State<PageListWidget<T>> {

  late PageContext<T> pageContext;
  EasyRefreshController _easyRefreshController = EasyRefreshController();

  @override
  void initState() {
    pageContext = widget.initPageContext();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
        controller: _easyRefreshController,
        header: PhoenixHeader(),
        footer: PhoenixFooter(),
        onLoad: () async {
          //上拉加载更多
          fetchData();
        },
        onRefresh: () async {
          //下拉刷新列表
          this.pageContext.dataList.clear();
          this.pageContext.pageNo = 1;
          this.pageContext.hasMore = true;
          fetchData();
        },
        child: widget.buildList(this.pageContext)
    );
  }


  /// 获取新数据
  void fetchData() {
    if (this.pageContext.hasMore == false) {
      return;
    }
    widget.fetchData(this.pageContext).then((result) {
      if (result.data == null) {
        return;
      }
      List<T> dataList = result.data??[];
      Paging paging = result.paging!;
      setState(() {
        this.pageContext.totalPages = paging.totalPages!;
        this.pageContext.dataList.addAll(dataList);
        if (this.pageContext.pageNo < this.pageContext.totalPages) {
          this.pageContext.pageNo = this.pageContext.pageNo + 1;
          this.pageContext.hasMore = true;
        } else {
          this.pageContext.hasMore = false;
        }
      });
    }).onError((error, stackTrace){
      print("分页获取数据失败");
    });
  }

}

class PageContext<T> {

  late int pageNo;
  late int pageSize;
  late int totalPages;
  late bool hasMore;
  late List<T> dataList;

  PageContext({int pageNo = 1, int pageSize = 10}) {
    this.pageNo = pageNo;
    this.pageSize = pageSize;
    this.totalPages = 1;
    this.hasMore = true;
    this.dataList = [];
  }

}