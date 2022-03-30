import 'package:email_password_login/classes/valveCard.dart';

class TreeValveModel{
  bool status;
  int litres;

  TreeValveModel({   
    required this.status, required this.litres});

  //data from the server
factory TreeValveModel.fromMap(map){
  return TreeValveModel(
  status: map['status'],
  litres: map['litres']
  );
}
  Map<String, dynamic> toMap(){
    return{
     'status' : status,
     'litres' : litres
    };
  }
}