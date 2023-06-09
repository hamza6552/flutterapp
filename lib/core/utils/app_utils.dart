import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static launchCaller(String phone_number, {context}) async {
    var url = "tel:$phone_number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      //FlushBar.showFlushBar('', 'Invalid phone number', context);
      throw 'Could not launch $url';
    }
  }

  static launchURL() async {
    const String homeLat = "37.3230";
    const String homeLng = "-122.0312";

    final String googleMapslocationUrl =
        "https://www.google.com/maps/search/?api=1&query=${homeLat},${homeLng}";

    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      // print('Could not launch $encodedURl');
      // throw 'Could not launch $encodedURl';
    }
  }

  static launchMap(lat, lng) async {
    var url = '';
    var urlAppleMaps = '';
    if (Platform.isAndroid) {
      url = "https://www.google.com/maps/search/?api=1&query=${lat},${lng}";
    } else {
      url = 'https://maps.apple.com/?q=$lat,$lng';
      // print("map url : $url");
      //url = "comgooglemaps://?saddr=&daddr=$lat,$lng&directionsmode=driving";
      // if (await canLaunch(url)) {
      //   await launch(url);
      // } else {
      //   throw 'Could not launch $url';
      // }
    }

    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
