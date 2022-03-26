import 'package:email_password_login/classes/valveCard.dart';

class ValveModel{
 int? valveNo = 0;
  int? moisture1 = 0;
  int? moisture2 = 0;
  int? temp = 0;
  int? windSpeed = 0;
  String? windDirection = "";
  int? flow = 0;
  String? status = "";
  String? nextSchedule = "";

  ValveModel({   
    this.valveNo, this.moisture1, this.moisture2, this.temp, this.windSpeed,this.windDirection, this.status,this.nextSchedule,this.flow});

  //data from the server
factory ValveModel.fromMap(Map map){
  return ValveModel(
    valveNo : map['valveNo'],
    moisture1 : map['moisture1'],
    moisture2 : map['moisture2'],
    temp : map['temp'],
    windSpeed : map['windSpeed'], 
    windDirection : map['windDirection'], 
    status : map['status'],
    nextSchedule : map['nextSchedule'],
    flow : map['flow']
  );
}
  Map<String, dynamic> toMap(){
    return{
     'valveNo' : valveNo,
    'moisture1' : moisture1,
    'moisture2' : moisture2,
    'temp' : temp,
    'windSpeed' : windSpeed, 
   'status' : status,
    'nextSchedule' : nextSchedule,
    'flow' : flow
    };
  }


}