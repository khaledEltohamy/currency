import 'package:intl/intl.dart';

extension DateTimeFormater on String {

  String getYesterday(int today){
        DateTime yesterdayFromDate = DateTime.now().subtract(Duration(days: today));
        final DateFormat formatter = DateFormat('yyyy-MM-dd');
        String date = formatter.format(yesterdayFromDate);
        return date;
  }
}