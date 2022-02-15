import 'package:date_format/date_format.dart';

// 0-59秒内：Just now
// 1-59分内：xm  ，如58分显示58m
// 1-24小时内： xh  ，如1.5小时显示1h，23小时59分显示23h
// 大于等于24小时且在本年：月 日， 如6月1日显示Jul 1
// 不在本年： 月 日 年，如2021年12月10日显示Dec 10 2021
/// [time]传入的时间戳，单位是秒
String formatDateForNotification(int time) {
  int now = new DateTime.now().millisecondsSinceEpoch;
  int tarTime = time * 1000; // 转成毫秒
  int differenceMilliseconds = now - tarTime;
  int minute = 60 * 1000;
  int hour = 60 * minute;
  int day = 24 * hour;
  if (differenceMilliseconds < minute) {
    return "Just now";
  } else if (differenceMilliseconds < hour) {
    return (differenceMilliseconds ~/ minute).toString() + 'm';
  } else if (differenceMilliseconds < day) {
    return (differenceMilliseconds ~/ hour).toString() + 'h';
  }
  if (DateTime.fromMillisecondsSinceEpoch(tarTime).year ==
      DateTime.now().year) {
    return formatDate(
        DateTime.fromMillisecondsSinceEpoch(tarTime), [M, ' ', dd]);
  } else {
    return formatDate(
        DateTime.fromMillisecondsSinceEpoch(tarTime), [M, ' ', dd, ' ', yyyy]);
  }
}

// 帖子时间日期：
// 12小时制；
// 同一年不显示年份，非本年需要显示年份
// 例子：
// 4:00 PM, Jul 1
// 12:00 AM, Dec 31 2020
/// [time]传入的时间戳，单位是秒
String formatDateForPost(int time) {
  int tarTime = time * 1000; // 转成毫秒
  if (DateTime.fromMillisecondsSinceEpoch(tarTime).year ==
      DateTime.now().year) {
    return formatDate(DateTime.fromMillisecondsSinceEpoch(tarTime),
        [h, ':', nn, ' ', am, ', ', M, ' ', dd]);
  } else {
    return formatDate(DateTime.fromMillisecondsSinceEpoch(tarTime),
        [h, ':', nn, ' ', am, ', ', M, ' ', dd, yyyy]);
  }
}

// 时间戳转日期
String timestampToDate(int timestamp) {
  int tarTime = timestamp * 1000; // 转成毫秒
  return formatDate(
      DateTime.fromMillisecondsSinceEpoch(tarTime), [M, ' ', m, ' ', d]);
}

// 日期转时间戳
int dateToTimestamp(DateTime date) {
  return date.millisecondsSinceEpoch ~/ 1000;
}

String formatTime(int timeNum) {
  return timeNum < 10 ? "0" + timeNum.toString() : timeNum.toString();
}

String formatSecond2HHMMSS(int seconds) {
  int day = seconds ~/ 86400;
  int hour = seconds % 86400 ~/ 3600;
  int minute = seconds % 3600 ~/ 60;
  int second = seconds % 60;
  return formatTime(hour) + ":" + formatTime(minute) + ":" + formatTime(second);
}

DayHourMinSec getDayHourMinSec(int seconds) {
  int day = seconds ~/ 86400;
  int hour = seconds % 86400 ~/ 3600;
  int minute = seconds % 3600 ~/ 60;
  int second = seconds % 60;
  return DayHourMinSec(
    day: day,
    hour: hour,
    min: minute,
    sec: second,
  );
}

String constructTime(int seconds) {
  int minute = seconds % 3600 ~/ 60;
  int second = seconds % 60;
  return formatTime(minute) + ":" + formatTime(second);
}

class DayHourMinSec {
  int day;
  int min;
  int sec;
  int hour;

  DayHourMinSec({
    this.day = 0,
    this.min = 0,
    this.sec = 0,
    this.hour = 0,
  });

  String get formatDay => formatTime(day);

  String get formatMin => formatTime(min);

  String get formatHour => formatTime(hour);

  String get formatSec => formatTime(sec);
}
