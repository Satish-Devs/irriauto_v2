import 'package:flutter/material.dart';

// Themedata for login page

ThemeData themeData = ThemeData(
        primarySwatch: Colors.orange,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange)),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange)),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red)),
        )
);


// copyright icon 
const IconData copyright = IconData(0xe198, fontFamily: 'MaterialIcons');

//footer

Padding footer =  Padding(
        padding:  EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              "             Designed by KPRIET ",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            Icon(
              copyright,
              size: 20,
            ),
            Text(
              " All rights reserved",
              style: TextStyle(
                fontSize: 15.0,
              ),
            )
          ],
        ),
      );