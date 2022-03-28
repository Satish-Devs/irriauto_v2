import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

// class LocationPage extends StatefulWidget {
//   const LocationPage({Key? key}) : super(key: key);

//   @override
//   State<LocationPage> createState() => _LocationPageState();
// }

// class _LocationPageState extends State<LocationPage> {
//   String location = 'Null, Press Button';
//   String Address = 'search';

class Permission {

  static Future<Position>  getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    //Test if location permissions are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // location services are not enabled don't continue
      //accessing position and request users of the app to enable the location services
      await Geolocator.openLocationSettings();
      return Future.error("Location services are disabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          "Location permissions are permanently denied, we cannot request permissions.");
    }

    // All permissions are attained as far as now!
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

}

  // Future<void> GetAddressFromLatLong(Position position) async {
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);

  //   print(placemarks);
  //   Placemark place = placemarks[0];
  //   Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  //   setState(() {
      
  //   });
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("Coordinate Points", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
//           Text(location,style: TextStyle(color: Colors.black,fontSize: 16),),
//           SizedBox(height: 10,),
//           Text('ADDRESS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
//           SizedBox(height: 10,),
//           Text('${Address}'),
//           ElevatedButton(onPressed: () async{
//             Position position = await _getGeoLocationPosition();
//             location ='Lat: ${position.latitude} , Long: ${position.longitude}';
//             GetAddressFromLatLong(position);
//           }, child: Text('Get Location'))
//         ],
//       ),
//     );
//   }
// }
