import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension DoubleExtension on num {
  double get flexibleHeight => ScreenUtil().setHeight(this) as double;
  double get flexibleWidth => ScreenUtil().setWidth(this) as double;
  double get fontSize => ScreenUtil().setSp(this) as double;

  /// Use to add horizontal space
  SizedBox get horizontalSpace => SizedBox(width: flexibleWidth);
  // Use to add vertical space
  SizedBox get verticalSpace => SizedBox(height: flexibleHeight);
}
