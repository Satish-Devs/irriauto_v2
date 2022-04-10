import 'package:email_password_login/classes/valveCard.dart';

class TreeValveModel{
  bool status;
  int litres;
  int consumed;

  TreeValveModel({   
    required this.status, required this.litres, required this.consumed});

  //data from the server
factory TreeValveModel.fromMap(map){
  return TreeValveModel(
  status: map['status'],
  litres: map['litres'],
  consumed: map['consumed']
  );
}
  Map<String, dynamic> toMap(){
    return{
     'status' : status,
     'litres' : litres,
     'consumed': consumed,
    };
  }
}