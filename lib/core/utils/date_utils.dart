// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:zabardash/core/utils/app_constants.dart';
//
// class DateUtil {
//   static int weekOfYear(DateTime date) {
//     int dayOfYear = int.parse(DateFormat("D").format(date));
//     return ((dayOfYear - date.weekday + 10) / 7).floor();
//   }
//
//   static DateTime getDateFromString(String date, String pattern) {
//     DateFormat format = DateFormat(pattern);
//     try {
//       return format.parse(date);
//     } catch (e) {
//       return null;
//     }
//   }
//
//   static String getFormattedDate(DateTime date, String pattern) {
//     DateFormat format = DateFormat(pattern);
//     final value = format.format(date);
//     return value;
//   }
//
//   static String formatDateFromTimeStamp(double timeStamp, String pattern) {
//     DateFormat format = DateFormat(pattern);
//     var date = DateTime.fromMillisecondsSinceEpoch(timeStamp.toInt() * 1000);
//     final value = format.format(date);
//     return value;
//   }
//
//   static String getAppFormattedDate(DateTime date) {
//     final format = DateFormat(AppConstants.appDateFormat);
//     return format.format(date);
//   }
//
//   static String getLocaleFormattedDate(DateTime date, BuildContext context) {
//     String locale = Localizations.localeOf(context).countryCode;
//     DateFormat format = DateFormat(locale);
//     return format.format(date);
//   }
//
//   static String getFormattedTime(TimeOfDay time, String outputPattern) {
//     final now = DateTime.now();
//     final date = DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     final format = DateFormat(outputPattern);
//     return format.format(date);
//   }
//
//   static String getAppFormattedTime(TimeOfDay time) {
//     return getFormattedTime(time, AppConstants.appTimeFormat);
//   }
//
//   static TimeOfDay getTimeOfDayFromDateTime(DateTime dateTime) {
//     return TimeOfDay.fromDateTime(dateTime);
//   }
//
//   static DateTime getDateTimeFromTimeOfDay(TimeOfDay timeOfDay) {
//     final now = DateTime.now();
//     final time = DateTime.utc(
//         now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
//     return time;
//   }
//
//   static DateTime convertLocalToUtcFormat(DateTime dateTime) {
//     return DateTime.utc(dateTime.year, dateTime.month, dateTime.day,
//         dateTime.hour, dateTime.minute, dateTime.second);
//   }
//
//   static String convertTimeStampToMintue(double timestamp) {
//     int stamp = timestamp.toInt();
//     var date = DateTime.fromMillisecondsSinceEpoch(stamp * 1000);
//     var formattedDate = DateFormat(AppConstants.appDateFormat);
//     return formattedDate.format(date);
//   }
//
//   static DateTime convertToTime(double timestamp) {
//     int stamp = timestamp.toInt();
//     var date = DateTime.fromMillisecondsSinceEpoch(stamp * 1000);
//     return date;
//   }
//
//   static String calculateTimeDifferenceBetween(
//       {@required double startDate, @required double endDate}) {
//     try {
//       int startTimeStamp = startDate.toInt();
//       int endTimeStamp = endDate.toInt();
//       var startTime =
//           DateTime.fromMillisecondsSinceEpoch(startTimeStamp * 1000);
//       var endTime = DateTime.fromMillisecondsSinceEpoch(endTimeStamp * 1000);
//       var timeDiff = endTime.difference(startTime);
//       print("time diff : $timeDiff");
//       return _printDuration(timeDiff);
//     } catch (_) {}
//   }
//
//   static String _printDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     String twoDigitHours = twoDigits(duration.inHours);
//     String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
//     String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
//     if (twoDigitMinutes != null && twoDigitMinutes.contains("00")) {
//       twoDigitMinutes = "";
//     } else {
//       twoDigitMinutes = "$twoDigitMinutes m";
//     }
//     return "${twoDigits(duration.inHours) == "00" ? "" : '${twoDigitHours} h'} ${twoDigitMinutes}";
//   }
//
//   static String convertToBillingDate(double timestamp) {
//     int stamp = timestamp.toInt();
//     var date = DateTime.fromMillisecondsSinceEpoch(stamp * 1000);
//     var dates = date.toUtc();
//     print("GMT date : $dates");
//     var formattedDate = DateFormat(AppConstants.apiDateBillingSummary);
//     return formattedDate.format(dates);
//   }
//
//   static double convertUtcTimeStamp(DateTime dateTime) {
//     final startUtcDate =
//         DateTime.utc(dateTime.year, dateTime.month, dateTime.day, 00, 00, 00);
//     var date = startUtcDate.millisecondsSinceEpoch / 1000;
//
//     return date;
//   }
// }
