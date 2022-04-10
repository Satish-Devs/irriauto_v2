import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/classes/valveCard.dart';
import 'package:email_password_login/model/sensor_model.dart';
import 'package:email_password_login/model/user_model.dart';
import 'package:email_password_login/model/valve_model.dart';
import 'package:email_password_login/screens/login_screen.dart';
import 'package:email_password_login/valve/valve_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref("sensorReadings");
  late SensorModel model;
  bool isLoading = true;

  void getData() async {
    setState(() {
      isLoading = true;
    });


    // DatabaseReference ref = FirebaseDatabase.instance.ref("sensorReadings");
    // DatabaseEvent event = await ref.once();

    // LinkedHashMap map = event.snapshot.value as LinkedHashMap;
    // SensorModel tempModel  = SensorModel.fromMap(map);
    // model = tempModel;


    setState(() {
      isLoading = false;
    });
  
  }
  
  
  
  @override
  void initState(){
    super.initState();
    getData();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Valves"),
        centerTitle: true,
      ),
      
      body: isLoading
              ? Center(child: CircularProgressIndicator())
              :SafeArea(
        child: MultiProvider(
          providers: [ 
            StreamProvider<SensorModel>(
                  create: (_) => ref.onValue.map((event) {
                    return SensorModel.fromMap(event.snapshot.value);
                  }), initialData: SensorModel(humidity: 0, m1: 0, m2: 0, m3: 0, m4: 0, rain: 0, temp: 0, waterFlow: 0)),
          ],
          child: VcardContainer()
        ),
      ),
      );
  }

  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
