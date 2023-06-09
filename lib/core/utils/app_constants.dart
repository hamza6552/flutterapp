import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/colors.dart';

class AppConstants {
  static final apiDateFormat = "dd-MM-yyyy";
  static final orderCreatedFormat = "MMMM dd yyyy, HH:mm";
  static final apiTimeFormat = "hh:mm a";
  static final appDateFormat = "dd.MM.yyyy";
  static final appTimeFormat = "hh:mm a";

  static final apiDateTimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static final queueAcceptedDateTimeFormat = "yyyy-MM-dd HH:mm:ss";

  static final apiTableBookingTimeFormat = "HH:mm";
  static final appTableBookingTimeFormat = "HH:mm";
  static final shiftMonthDay = "MMM:mm";
  static final monthOfDate = "MMM";
  static final dayOfDate = "dd";
  static final yearOfDate ="yyyy";

  static final apiDateBillingSummary = "dd MMM yyyy";

  static BoxShadow containerShadow = BoxShadow(
    color: UIColors.halfLight,
    blurRadius: 16,
    spreadRadius: -10,
    // blurRadius: 8,
    // spreadRadius: 4,
    // offset: Offset(0, 10),
  );

}

