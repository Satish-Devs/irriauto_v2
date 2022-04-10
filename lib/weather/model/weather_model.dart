class Weather{
  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
  String? windDirection;
  int? visibility;
  

  Weather({
    this.cityName,
    this.temp,
    this.feels_like,
    this.humidity,
    this.pressure,
    this.wind,
    this.windDirection,
    this.visibility,
  });

  // Let's build a function to parse the JSON file into the model

  Weather.fromJson(Map<String, dynamic> json){
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
    windDirection = getDirection(json["wind"]["deg"]);
    visibility = json["visibility"];
  }

  String getDirection(degree){
    if ((degree>337.5 && degree<360)|| (degree>22.5 && degree<22.5))
    {
      return 'Northerly';
    }
    else if(degree>22.5 && degree<67.5){
      return 'North Easterly';
    }
    else if(degree>67.5 && degree<112.5){
      return 'Easterly';
      }
    else if(degree>122.5 && degree<157.5){
      return 'South Easterly';
      } 
    else if(degree>157.5 && degree<202.5){
      return 'Southerly';
      }
    else if(degree>202.5 && degree<247.5){
      return 'South Westerly';
      }
    else if(degree>247.5 && degree<292.5){
      return 'Westerly';
      }
    else if(degree>292.5 && degree<337.5){return 'North Westerly';}

    return "Data Not Available";
}

}