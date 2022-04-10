import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UserLogScreen extends StatefulWidget {
  const UserLogScreen({Key? key}) : super(key: key);

  @override
  State<UserLogScreen> createState() => _UserLogScreenState();
}

class _UserLogScreenState extends State<UserLogScreen> {
  var _logRef = FirebaseDatabase.instance.ref().child("userLogs");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User log details"),
        centerTitle: true,
      ),
      body: Container(
        child: StreamBuilder(
          stream: _logRef.onValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data);
              return Container();
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
