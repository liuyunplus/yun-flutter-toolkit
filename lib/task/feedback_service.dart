import 'http_util.dart';
import 'my_feedback.dart';

class FeedbackService {

  static Future<List<MyFeedback>> getMyFeedbackLIst() async {
    List<MyFeedback> resultList = [];
    var response = await HttpUtil.getInstance()?.get("api/v1/ugc/feedback/getByMaxId?maxId=1");
    var _data = response['data'];
    List dataList = _data['list'];
    dataList.forEach((item) {
      MyFeedback info = MyFeedback.fromJson(item);
      resultList.add(info);
    });
    return resultList;
  }

}