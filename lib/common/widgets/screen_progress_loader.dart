import 'package:flutter/material.dart';
import 'package:zabardash/core/utils/colors.dart';

class ScreenProgressLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: IgnorePointer(
        ignoring: false,
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
          child: Center(
            child: CCProgressLoader(),
          ),
        ),
      ),
    );
  }
}

class CCProgressLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          CircularProgressIndicator(
            strokeWidth: 3,
            color: UIColors.primaryColor,
          ),
          SizedBox(
            height: 16,
          ),
          Text("please_wait")
        ],
      ),
    );
  }
}
