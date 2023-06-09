// import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart' as Locator;
// import 'package:location/location.dart';
// import 'package:zabardash/core/utils/permissions_utils.dart';
//
// class LocationUtils {
//   static Future<Coordinate> getCurrentLocation() async {
//     Location location = new Location();
//
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//     LocationData _locationData;
//
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return null;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return null;
//       }
//     }
//     location.changeSettings(
//       accuracy: LocationAccuracy.high,
//       interval: 2500,
//     );
//     _locationData = await location.getLocation();
//
//     return location == null
//         ? null
//         : Coordinate(_locationData.latitude, _locationData.longitude);
//   }
//
//   static Future<int> getDistanceInMeters(
//       Coordinate start, Coordinate end) async {
//     if (start == null || end == null) return -1;
//     final distance = await Locator.Geolocator().distanceBetween(
//         start.latitude, start.longitude, end.latitude, end.longitude);
//     return distance.toInt();
//   }
//
//   static Future<bool> requestLocation() async {
//     if (await PermissionsUtils.requestLocationPermission()) {
//       Location location = new Location();
//       bool _serviceEnabled = await location.serviceEnabled();
//       if (!_serviceEnabled) {
//         return await location.requestService();
//       }
//       return true;
//     } else
//       return false;
//   }
//
//   static Future<String> getCurrentCity(Coordinate currentLocation) async {
//     if (currentLocation != null) {
//       try {
//         final addresses = await Geocoder.local.findAddressesFromCoordinates(
//             new Coordinates(
//                 currentLocation.latitude, currentLocation.longitude));
//         return addresses.first.locality;
//       } catch (e) {}
//     }
//     return "";
//   }
// }
//
// class Coordinate {
//   double latitude;
//   double longitude;
//   Coordinate(this.latitude, this.longitude);
// }
