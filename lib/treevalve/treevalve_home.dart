import 'package:email_password_login/home/home_screen.dart';
import 'package:email_password_login/model/treevalve_model.dart';
import 'package:email_password_login/valve/valve_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

// Statful Widget

class TreeValvePage extends StatefulWidget {
  const TreeValvePage({Key? key}) : super(key: key);

  @override
  _TreeValvePageState createState() => _TreeValvePageState();
}

class _TreeValvePageState extends State<TreeValvePage> {
  DatabaseReference ref = FirebaseDatabase.instance.ref("separateValve");
  // form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController litreController = new TextEditingController();
  final litre = 20;

  //firebase
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    //litre field
    final litreField = TextFormField(
      style: TextStyle(color: Colors.black, fontSize: 20),
      autofocus: false,
      controller: litreController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter a valid litre");
        }
        if (int.parse(value) > 1000) {
          return ("Please enter a litre less than 1000");
        }

        return null;
      },
      onSaved: (value) {
        litreController.text = value!;
      },
      textInputAction: TextInputAction.send,
      decoration: InputDecoration(
          iconColor: Colors.orange[500],
          prefixIcon: Icon(Icons.water_drop),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Amount of water in litres",
          hintStyle: TextStyle(color: Colors.black, fontSize: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    var submitButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.orange[500],
      child: MaterialButton(
        onPressed: () {
          print(litreController.text);
          toggleValve(int.parse(litreController.text));
        },
        child: Text(
          "Turn on",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        // minWidth: MediaQuery.of(context).size.width,
      ),
    );
    var offButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.orange[500],
      child: MaterialButton(
        onPressed: () async {
          await ref
              .update({
                "status": false,
              "litres": 0})
              .then((_) => {
                    Fluttertoast.showToast(msg: "Turned off!"),
                  })
              .catchError((e) {
                Fluttertoast.showToast(msg: e!.message);
              });
        },
        child: Text(
          "Turn off",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        // minWidth: MediaQuery.of(context).size.width,
      ),
    );

    var InputContainer =
        Consumer<TreeValveModel>(builder: (context, model, child) {
      return Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Image.network("https://purepng.com/public/uploads/large/purepng.com-treenaturetreegreensummer-831524002233ibnn9.png",
                    scale: .35,),
                    SizedBox(
                      height: 45,
                    ),
                    !model.status ? litreField : SizedBox(),
                    SizedBox(
                      height: 35,
                    ),
                    !model.status ? submitButton : Container(),
                    
                    Column(
                      children: [
                        model.status
                            ? Text(
                                "Litres Consumed : ${model.consumed} / ${model.litres}",
                                style: TextStyle(fontSize: 25),
                              )
                            : SizedBox(),
                        
                        SizedBox(height: 20,),
                        model.status?Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Status  :  ',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            model.status
                                ? Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                  )
                                : Container(),
                            Text(
                              '${!model.status ? " Idle" : " Running"}',
                              style: TextStyle(
                                fontFamily: 'Lexend Deca',
                                color:
                                    !model.status ? Colors.red : Colors.green,
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ):Container(),
                        SizedBox(
                          height: 20,
                        ),
                        model.status ? offButton : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Set Litres"),
      ),
      body: MultiProvider(
        providers: [
          StreamProvider<TreeValveModel>(
              create: (_) => ref.onValue.map((event) {
                    return TreeValveModel.fromMap(event.snapshot.value);
                  }),
              initialData: TreeValveModel(status: false, litres: 0, consumed: 0)),
        ],
        child: InputContainer,
      ),
    );
  }

  //sendLitre function
  void toggleValve(litres) async {
    if (_formKey.currentState!.validate()) {
      await ref
          .update({"litres": litres, "status": true})
          .then((_) => {
                Fluttertoast.showToast(msg: "Turned on!"),
              })
          .catchError((e) {
            Fluttertoast.showToast(msg: e!.message);
          });
    }
  }
}
