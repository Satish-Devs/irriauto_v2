import 'package:email_password_login/model/log_model.dart';
import 'package:email_password_login/userlogs/userlog_utils.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserLogScreen extends StatefulWidget {
  const UserLogScreen({Key? key}) : super(key: key);

  @override
  State<UserLogScreen> createState() => _UserLogScreenState();
}

class _UserLogScreenState extends State<UserLogScreen> {
  DatabaseReference _logRef = FirebaseDatabase.instance.ref("userLogs");
  late List<Map> _logs = [];

  @override
  void initState() {
    super.initState();
  }

  List<Map> getList(map) {

      List<Map> logs = [];
      for (var item in map.keys) {
        print(map[item]);
        logs.add(map[item]);
      }
      return logs;
    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User log details"),
          centerTitle: true,
        ),
        body: MultiProvider(
            providers: [
              StreamProvider<Map>(
                  create: (_) => _logRef.orderByValue().onValue.map((event) {
                        return event.snapshot.value as Map;
                      }),
                  initialData: {
                    'email': 'user',
                    'ipv4': 'address',
                    'ipv64': 'address',
                    'time': 'time',
                    'action': 'action'
                  } as Map),
            ],
            child: Consumer<Map>(builder: (context, logs, child) {
              return ListView.builder(
                  itemCount: getList(logs as Map).length,
                  itemBuilder: (context, index) =>
                      LogCard(log: LogModel.fromMap(getList(logs as Map)[index])));
            })));
  }
}
