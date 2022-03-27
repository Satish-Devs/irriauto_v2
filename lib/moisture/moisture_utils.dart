import 'package:email_password_login/model/sensor_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'moistureCard.dart';
class McardContainer extends StatefulWidget {
  const McardContainer({ Key? key }) : super(key: key);

  @override
  State<McardContainer> createState() => _McardContainerState();
}

class _McardContainerState extends State<McardContainer> {
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
                  MoistureCard(valveNo :1, moisture1: SensorModel.m1,moisture2 : SensorModel.m2,),
                  MoistureCard(valveNo :2, moisture1: SensorModel.m3,moisture2 : SensorModel.m4,),
                ]
                ),
               
            );
      }
    );
  }
}