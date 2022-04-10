import 'package:email_password_login/weather/model/weather_model.dart';
import 'package:email_password_login/weather/services/permission.dart';
import 'package:email_password_login/weather/services/weather_api_client.dart';
import 'package:email_password_login/weather/views/additional_info.dart';
import 'package:email_password_login/weather/views/current_weather.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // Now let's check if everything works
  // we will call the api in the init state function
  String location = 'Perundurai';
  String Address = 'search';

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      location = place.locality!;
    });
  }

  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  @override
  void initState() {
    super.initState();
    client.getCurrentWeather("Georgia");
    // Ok now everything work
    // better method
    // Future Builder widget
  }

  Future<void> getData(String location) async {
    data = await client.getCurrentWeather(location);
  }

  @override
  Widget build(BuildContext context) {
    // the first thing that we're goinf to create the UI of the app
    return Scaffold(
        backgroundColor: Color(0xFFf9f9f9),
        appBar: AppBar(
          backgroundColor: Colors.orange[500],
          elevation: 0.0,
          title: Text(
            "Weather",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getData(location),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              //here we will display the data from the api
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  //let's create custom widget

                  // extra ones!

                  Text(
                    "Current Location",
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xdd212121),
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 20.0,),

                  Text(
                    location,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Text('${Address}'),

                  SizedBox(height: 10.0,),

                  ElevatedButton(
                      onPressed: () async {
                        Position position =
                            await Permission.getGeoLocationPosition();
                        location =
                            'Lat: ${position.latitude} , Long: ${position.longitude}';
                        GetAddressFromLatLong(position);

                      },
                      child: Text('Get Location')),

                  SizedBox(height: 20.0,),

                  currentWeather(Icons.wb_sunny_rounded, "${data!.temp}",
                      "${data!.cityName}"),

                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Additional Information",
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Color(0xdd212121),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  // Now let's create the additional information widget
                  additionalInformation("${data!.wind}", "${data!.humidity}",
                      "${data!.pressure}", "${data!.feels_like}","${data!.windDirection}","${data!.visibility}")

                  //Now that we have UI let's start integrating the API
                  //Let's create the model to store the data
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container();
          },
        ));
  }
}
