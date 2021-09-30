class ApiResponse<T> {

  /* 返回状态 */
  int? status;
  /* 返回信息 */
  String? message;
  /* 返回数据 */
  T? data;
  /* 分页信息 */
  Paging? paging;

}

class Paging {

  /* 当前页 */
  int? pageNo;
  /* 页面大小 */
  int? pageSize;
  /* 总记录数 */
  int? totalElements;
  /* 总页数 */
  int? totalPages;
  /* 是否有下一页 */
  bool? hasNext;

}
