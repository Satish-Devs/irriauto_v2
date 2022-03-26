class SensorModel {

    var humidity;
    var m1;
    var m2;
    var m3;
    var m4;
    var rain;
    var temp;

    SensorModel({required this.humidity, required this.m1,required this.m2,required this.m3, required this.m4, required this.rain,required this.temp});

    factory SensorModel.fromMap(map){
  return SensorModel(
   humidity : map["humidity"],
    m1 : map["m1"],
    m2 : map["m2"],
    m3 : map["m3"],
    m4 : map["m4"],
    rain : map["rain"],
    temp : map["temp"]
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
    "temp" : temp
    };
  }


    
}