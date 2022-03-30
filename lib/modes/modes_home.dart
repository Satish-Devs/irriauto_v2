import 'package:email_password_login/model/sensor_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modes_utils.dart';

class Modes extends StatefulWidget {
  @override
  _ModesState createState() => _ModesState();
}

class _ModesState extends State<Modes> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DatabaseReference ref = FirebaseDatabase.instance.ref("sensorReadings");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.orange[500],
        // automaticallyImplyLeading: false,
        title: Text(
          'Select the mode',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: MultiProvider(
              providers: [
                StreamProvider<SensorModel>(
                    create: (_) => ref.onValue.map((event) {
                          return SensorModel.fromMap(event.snapshot.value);
                        }),
                    initialData: SensorModel(
                        humidity: 0,
                        m1: 0,
                        m2: 0,
                        m3: 0,
                        m4: 0,
                        rain: 0,
                        temp: 0,
                        mode: 0)),
              ],
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  AutoMode(),
                  SizedBox(height: 5,),
                  ManualMode(),
                ],
              ),
            )),
      ),
    );
  }
}
