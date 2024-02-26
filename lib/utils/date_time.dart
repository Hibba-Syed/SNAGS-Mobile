import 'package:intl/intl.dart';
class DateTimeUtil {
  static String getFormattedDate(String? date){
    if(date?.isNotEmpty??false){
      DateTime dateTime = DateTime.parse(date!).toLocal();
      String formattedDate = DateFormat.yMMMMd().format(dateTime);
      return formattedDate;
    }
    return '--';
  }
}
