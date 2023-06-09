// import 'package:flutter/material.dart';
// import 'package:location_permissions/location_permissions.dart';
// import 'package:zabardash/core/utils/adaptive_alert_dialog.dart';
//
// class PermissionsUtils {
//   static Future<bool> isLocationAccessAllowed() async {
//     final status = await LocationPermissions().checkPermissionStatus();
//     return status == PermissionStatus.granted;
//   }
//
//   static Future<bool> requestLocationPermission() async {
//     final status = await LocationPermissions().requestPermissions(
//         permissionLevel: LocationPermissionLevel.locationWhenInUse);
//     return status == PermissionStatus.granted;
//   }
//
//   static Future<bool> hasUserDeniedLocationPermission() async {
//     final status = await LocationPermissions().checkPermissionStatus();
//     return status == PermissionStatus.denied;
//   }
//
//   static openSettings() async {
//     LocationPermissions().openAppSettings();
//   }
//
//   static showGrantLocationPermissionsDialog(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AdaptiveAlertDialog(
//             title: "Location Permission",
//             message:
//                 "Application needs location permission to events and news.",
//             actions: [
//               AdaptiveAlertAction(
//                   text: "Open Settings",
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     PermissionsUtils.openSettings();
//                   }),
//               AdaptiveAlertAction(
//                   text: "Cancel",
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   }),
//             ],
//           );
//         });
//   }
// }
