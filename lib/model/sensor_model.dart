import 'package:flutter/cupertino.dart';

class SensorModel with ChangeNotifier{

    var humidity;
    var m1;
    var m2;
    var m3;
    var m4;
    var rain;
    var temp;
    var v1;
    var v2;
    var mode;

    SensorModel({required this.humidity, required this.m1,required this.m2,required this.m3, required this.m4, required this.rain,required this.temp,this.v1, this.v2, this.mode});

    factory SensorModel.fromMap(map){
  return SensorModel(
   humidity : map["humidity"],
    m1 : map["m1"],
    m2 : map["m2"],
    m3 : map["m3"],
    m4 : map["m4"],
    rain : map["rain"],
    temp : map["temp"],
    v1 : map["v1"],
    v2 : map["v2"],
    mode: map["mode"]
  );
  
}



Map<String, dynamic> toMap(){
    return{
      "humidity" : humidity,
    "m1" : m1,
    "m2" : m2,
    "m3" : m3,
    "m4" : m4,
    "rain" : rain,
    "temp" : temp,
    "v1": v1,
    "v2" : v2,
    "mode": mode
    };
  }


    
}