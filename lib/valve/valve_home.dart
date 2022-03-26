import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/classes/valveCard.dart';
import 'package:email_password_login/model/sensor_model.dart';
import 'package:email_password_login/model/user_model.dart';
import 'package:email_password_login/model/valve_model.dart';
import 'package:email_password_login/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SensorModel model;
  bool isLoading = true;

  void getData() async {
    setState(() {
      isLoading = true;
    });
    print("Sunil is great developer");

    DatabaseReference ref = FirebaseDatabase.instance.ref("sensorReadings");
    DatabaseEvent event = await ref.once();

    LinkedHashMap map = event.snapshot.value as LinkedHashMap;
    SensorModel tempModel  = SensorModel.fromMap(map);
    model = tempModel;

    setState(() {
      isLoading = false;
    });
  
  }
  



  

  List<ValveModel> valveList = [
    ValveModel.fromMap( { 'temp': 45, 'nextSchedule': '9.00 am 07/03/2022', 'moisture2': 78, 'moisture1': 48, 'windDirection': 'East - West', 'windSpeed': 110, 'flow': 200, 'status': 'Idle', 'valveNo': 1}), ValveModel.fromMap( { 'temp': 45, 'nextSchedule': '9.00 am 07/03/2022', 'moisture2': 78, 'moisture1': 48, 'windDirection': 'East - West', 'windSpeed': 110, 'flow': 200, 'status': 'Idle', 'valveNo': 2})];
  
  
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child:   ListView( padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              
              ValveCard(valveNo : 1, moisture1: model.m1,moisture2 :model.m2, temp :model.temp,windSpeed : 80,windDirection : "North to South", status : "Idle", nextSchedule : "Scheduled on 9am",flow :  100),

              ValveCard(valveNo : 2, moisture1: model.m3,moisture2 :model.m4, temp :model.temp,windSpeed : 80,windDirection : "North to South", status : "Idle", nextSchedule : "Scheduled on 9am",flow :  100),

            ]
            ),
           
        ),
      ),
      );
  }

  Future<void> logout(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
