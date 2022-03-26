import 'package:flutter/material.dart';

import 'modes_utils.dart';


class Modes extends StatefulWidget {
  
  @override
  _ModesState createState() => _ModesState();
}

class _ModesState extends State<Modes> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          child: Column(
            children: [
              AutoMode(),
              ManualMode(),
            ],
          ),
        ),
      ),
    );
  }
}


