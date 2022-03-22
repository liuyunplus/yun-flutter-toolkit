class MyFeedback {

  int? id;
  int? carId;
  int? userId;
  String? category;
  String? content;
  String? creatorNick;
  String? creatorType;
  int? parentId;
  int? created;
  int? updated;

  MyFeedback.fromJson(Map<String, dynamic> map) {
    this.id = map['id'] != null ? int.parse(map['id']) : null;
    this.carId = map['carId'] != null ? int.parse(map['carId']) : null;
    this.userId = map['userId'] != null ? int.parse(map['userId']) : null;
    this.category = map['category']??null;
    this.content = map['content']??null;
    this.creatorNick = map['creatorNick']??null;
    this.creatorType = map['creatorType']??null;
    this.parentId = map['parentId'] != null ? int.parse(map['parentId']) : null;
    this.created = map['created']??null;
    this.updated = map['updated']??null;
  }

}
