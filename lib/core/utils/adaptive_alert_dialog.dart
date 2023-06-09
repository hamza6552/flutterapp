import 'package:flutter/material.dart';

class AdaptiveAlertDialog extends StatelessWidget {
  const AdaptiveAlertDialog({Key? key, required this.message})
      : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error'),
      content: Text(message),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
