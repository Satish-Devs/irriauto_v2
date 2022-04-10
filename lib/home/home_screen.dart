import 'package:email_password_login/model/sensor_model.dart';
import 'package:email_password_login/model/user_model.dart';
import 'package:email_password_login/modes/modes_home.dart';
// import 'package:email_password_login/moisture/moistureCard.dart';
// import 'package:email_password_login/moisture/moisture_home.dart';
import 'package:email_password_login/treevalve/treevalve_home.dart';
import 'package:email_password_login/utils/utils.dart';
import 'package:email_password_login/valve/valve_home.dart';
import 'package:email_password_login/weather/services/permission.dart';
import 'package:email_password_login/weather/weather.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../screens/login_screen.dart';
import 'home_item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const _categoryNames = <String>[
    ' Valve Status',
    // 'Moisture Level',
    'Operating Mode',
    'Litre Based Irrigation',
    'Weather',
    //'Log Details'
    // 'Water Flow',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    // Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    // Colors.yellow,
    Colors.greenAccent,
    // Colors.purpleAccent
  ];

  static const _icons = <IconData>[
    Icons.donut_large_sharp,
    // Icons.compost,
    Icons.model_training_sharp,
    Icons.support_sharp,
    Icons.wb_sunny_sharp,
    // Icons.person_outlined
    // Icons.filter_alt,
  ];

  static List<Widget> st = <Widget>[
    HomeScreen(),
    Modes(),
    TreeValvePage(),
    WeatherPage(),
    // WeatherPage(),
  ];

  final _primaryColor = Colors.white;
  final _secondaryColor = Colors.black;

  Widget _buildCategoryWidgets(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> logout(BuildContext context) async {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()));
    }

    final categories = <Category>[];

    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
        name: _categoryNames[i],
        color: _baseColors[i] as ColorSwatch<dynamic>,
        iconLocation: _icons[i],
        st: st[i],
      ));
    }

    final listView = Container(
      color: _primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(categories),
    );

    final appBar = AppBar(
      actions: <Widget>[
        Row(
          children: [
            Text(
              "Logout",
              style: TextStyle(
                  color: _secondaryColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600),
            ),
            IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                )),
          ],
        )
      ],
      centerTitle: false,
      title: Text(
        "Home",
        style: TextStyle(
          color: _secondaryColor,
          fontSize: 25.0,
        ),
      ),
      elevation: 1.0,
    );

    return Scaffold(
      appBar: appBar,
      body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: listView,
          ),
          // bottomSheet: footer,
    );
  }
}
