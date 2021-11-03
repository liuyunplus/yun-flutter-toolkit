import 'package:intl/intl.dart';

const String TIME_FORMAT_PATTERN1  = 'yyyy-MM-dd HH:mm:ss';
const String TIME_FORMAT_PATTERN2  = 'yyyy-MM-dd HH:mm';

class DateUtil {

  static String formatDateTime(DateTime date, {String pattern = TIME_FORMAT_PATTERN1}) {
    DateFormat dateFormat = DateFormat(pattern);
    return dateFormat.format(date);
  }

}