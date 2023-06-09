import 'package:flutter/material.dart';
import 'adaptive_alert_dialog.dart';

class ShowErrorAlert {
  static showAdaptiveDialog(BuildContext context, {required String message}) {
    showDialog(
        context: context,
        builder: (context) {
          return AdaptiveAlertDialog(message: message);
        });
  }
}
