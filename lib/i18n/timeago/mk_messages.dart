import 'package:timeago/timeago.dart';

class MkMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'пред';
  @override
  String suffixFromNow() => 'од сега';
  @override
  String lessThanOneMinute(int seconds) => 'момент';
  @override
  String aboutAMinute(int minutes) => 'минута';
  @override
  String minutes(int minutes) => '$minutes минути';
  @override
  String aboutAnHour(int minutes) => 'околу еден час';
  @override
  String hours(int hours) => '$hours часа';
  @override
  String aDay(int hours) => 'ден';
  @override
  String days(int days) => '$days дена';
  @override
  String aboutAMonth(int days) => 'околу еден месец';
  @override
  String months(int months) => '$months месеци';
  @override
  String aboutAYear(int year) => 'околу една година';
  @override
  String years(int years) => '$years години';
  @override
  String wordSeparator() => ' ';
}
