import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_password_login/classes/valveCard.dart';
import 'package:email_password_login/model/user_model.dart';
import 'package:email_password_login/model/valve_model.dart';
import 'package:email_password_login/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/sensor_model.dart';
import 'moistureCard.dart';

class MoistureScreen extends StatefulWidget {

  @override
  _MoistureScreenState createState() => _MoistureScreenState();
}

class _MoistureScreenState extends State<MoistureScreen> {
  late  SensorModel model;
  bool isLoading = false;

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
  
  @override
  void initState(){
    super.initState();
    getData();
    
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moisture Readings"),
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
              
              MoistureCard(valveNo :1, moisture1: model.m1,moisture2 : model.m2,),

              MoistureCard(valveNo :2, moisture1: model.m3,moisture2 : model.m4,),
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
