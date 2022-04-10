import 'package:email_password_login/model/sensor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Datetime stuff
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AutoMode extends StatefulWidget {
  const AutoMode({
    Key? key,
  }) : super(key: key);

  @override
  State<AutoMode> createState() => _AutoModeState();
  
  
}

class _AutoModeState extends State<AutoMode> {
   User? _currentUser;
   DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  
   var uuid = Uuid();
  
  Future<void> getUser() async {
    _currentUser =  await FirebaseAuth.instance.currentUser;
  }

  @override
  void initState(){
    super.initState();
    getUser();
  }
  
  // bool auto = false;
  DatabaseReference ref = FirebaseDatabase.instance.ref("sensorReadings");
 

  void toggleMode(modeVal) async {
    await ref.update({
      "mode": modeVal,
    });
    addUserLog(modeVal?"Auto mode is turned on":"Auto mode is turned off");
  }

  void toggleValve(valveNo, status) async {
     
      print("Sunil is a great developer");
      await ref.update({
        "v$valveNo": !status,
      });
  }

  void addUserLog(action) async{
    DatabaseReference userRef = FirebaseDatabase.instance.ref("userLogs");
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    await userRef.child(uuid.v4()).update(
        {
          "time" : currentTime.toString(),
          "email": _currentUser!.email,
          "action": action 
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SensorModel>(builder: (context, sensorModel, child) {
      return Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              color: Color(0x32171717),
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Image.asset(
                  'assets/auto_mode.webp',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Auto Mode',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF090F13),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          sensorModel.mode ? 'is turned on' : 'is turned off',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: sensorModel.mode ? Colors.green[500]: Colors.red[500] ,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(sensorModel.mode? Icons.toggle_on : Icons.toggle_off , color: sensorModel.mode ? Colors.green[500]: Colors.red[500],),

                onPressed: () {
                  setState(() {
                    toggleMode(!sensorModel.mode);
                    toggleValve(1, true);
                    toggleValve(2, true);
                    
                  });
                },
                iconSize: 65,
              )
            ],
          ),
        ),
      );
    });
  }
}

class ManualMode extends StatefulWidget {
  const ManualMode({
    Key? key,
  }) : super(key: key);

  @override
  State<ManualMode> createState() => _ManualModeState();
}

class _ManualModeState extends State<ManualMode> {
  DatabaseReference ref = FirebaseDatabase.instance.ref("sensorReadings");
   User? _currentUser;
   DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  
  var uuid = Uuid();

  @override
  void initState(){
    super.initState();
    getUser();
  }
  

  Future<void> getUser() async {
    _currentUser =  await FirebaseAuth.instance.currentUser;
  }

  void addUserLog(action) async{
    getUser();
    setState(() {
      
    });
    DatabaseReference userRef = FirebaseDatabase.instance.ref("userLogs");
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    await userRef.child(uuid.v4()).update(
        {
          "time" : currentTime.toString(),
          "email": _currentUser!.email,
          "action": action 
        }
      );
  }

  void toggleMode(modeVal) async {
    await ref.update({
      "mode": modeVal,
    });

    addUserLog(!modeVal?"Manual mode is turned on":"Manual mode is turned off");
  }

  void toggleValve(valveNo, status) async {
  
      await ref.update({
        "v$valveNo": !status,
      });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SensorModel>(builder: (context, sensorModel, child) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: Color(0x32171717),
                  offset: Offset(0, 3),
                )
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/manual_mode.jpg',
                      width: 55,
                      height: 55,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Manual Mode',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              !sensorModel.mode
                                  ? 'is turned on'
                                  : 'is turned off',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                               color: !sensorModel.mode ? Colors.green[500]: Colors.red[500],
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(!sensorModel.mode
                        ? Icons.toggle_on
                        : Icons.toggle_off, color: !sensorModel.mode ? Colors.green[500]: Colors.red[500],),
                    onPressed: () {
                      setState(() {
                        toggleMode(!sensorModel.mode);
                        toggleValve(1, true);
                        toggleValve(2, true);
                      });
                    },
                    iconSize: 65,
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 10,),
          //valve control
          !sensorModel.mode? Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/valve.webp',
                          width: 55,
                          height: 55,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Valve 1',
                                style: TextStyle(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 4, 0, 0),
                                child: Text(
                                  !sensorModel.v1
                                      ? 'is Idle'
                                      : 'is Running',
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: sensorModel.v1 ? Colors.green[500]: Colors.red[500],
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(!sensorModel.v1
                            ? Icons.play_circle
                            : Icons.stop_circle ,color: Colors.grey[850],
                            ),
                        onPressed: () {
                          setState(() {
                            addUserLog(sensorModel.v1?"Valve is turned off":"Valve is turned on");
                            toggleValve(1, sensorModel.v1);
                            
                          });
                        },
                        iconSize: 55,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  // // Valve 2
                  // Row(
                  //   mainAxisSize: MainAxisSize.max,
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     Center(
                  //       child: Image.asset(
                  //         'assets/valve.webp',
                  //         width: 55,
                  //         height: 55,
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Padding(
                  //         padding:
                  //             EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                  //         child: Column(
                  //           mainAxisSize: MainAxisSize.max,
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               'Valve 2',
                  //               style: TextStyle(
                  //                 fontFamily: 'Lexend Deca',
                  //                 color: Color(0xFF090F13),
                  //                 fontSize: 20,
                  //                 fontWeight: FontWeight.w500,
                  //               ),
                  //             ),
                  //             Padding(
                  //               padding: EdgeInsetsDirectional.fromSTEB(
                  //                   0, 4, 0, 0),
                  //               child: Text(
                  //                 !sensorModel.v2
                  //                     ? 'is Idle'
                  //                     : 'is Running',
                  //                 style: TextStyle(
                  //                   fontFamily: 'Lexend Deca',
                  //                   color: Colors.red,
                  //                   fontSize: 12,
                  //                   fontWeight: FontWeight.normal,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     IconButton(
                  //       icon: !sensorModel.v2
                  //           ? Icon(Icons.invert_colors_off_rounded)
                  //           : Icon(Icons.invert_colors),
                  //       onPressed: () {
                  //         setState(() {
                  //           toggleValve(2, sensorModel.v2);
                  //         });
                  //       },
                  //       iconSize: 65,
                  //     )
                  //   ],
                  // ),
                ]),
          ): SizedBox(height: 10,)
          // Valve 1
        ],
      );
    });
  }
}
