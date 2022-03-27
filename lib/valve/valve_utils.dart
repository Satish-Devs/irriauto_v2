import 'package:email_password_login/classes/valveCard.dart';
import 'package:email_password_login/model/sensor_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VcardContainer extends StatefulWidget {
  const VcardContainer({ Key? key }) : super(key: key);

  @override
  State<VcardContainer> createState() => _VcardContainerState();
}

class _VcardContainerState extends State<VcardContainer> {
  @override
  Widget build(BuildContext context) {
    print("Sunil is a great developer");
    return Consumer<SensorModel>(
      builder: (context, SensorModel, child) {
        // print(SensorModel.humidity);

      return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child:   ListView( padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              
              ValveCard(valveNo : 1, moisture1: SensorModel.m1,moisture2 :SensorModel.m2, temp :SensorModel.temp, status : SensorModel.v1,flow :  100, humidity : SensorModel.humidity, rain : SensorModel.rain),
              ValveCard(valveNo : 2, moisture1: SensorModel.m3,moisture2 :SensorModel.m4, temp :SensorModel.temp, status : SensorModel.v2,flow :  100, humidity : SensorModel.humidity, rain : SensorModel.rain),
            ]
            ),
            
   
      );
      }
    );
  }
}