// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

// class HomePages extends StatefulWidget {
//     static const routeName = '/locate-screen';
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePages> {
//   Position ? _currentPosition;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Location"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (_currentPosition != null) Text(
//               "LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}"
//             ),
//             ElevatedButton(
//               child: Text("Get location"),
//               onPressed: () {
//                 _getCurrentLocation();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _getCurrentLocation() {
//     Geolocator
//       .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
//       .then((Position position) {
//         setState(() {
//           _currentPosition = position;
//         });
//       }).catchError((e) {
//         // print(e);
//       });
//   }
// }