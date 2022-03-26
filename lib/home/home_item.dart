import 'package:email_password_login/valve/valve_home.dart';
import 'package:flutter/material.dart';


const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);


class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final st;

  const Category({
    Key? key,
    required this.name,
    required this.color,
    required this.iconLocation,
    required this.st,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: _rowHeight,
        child: InkWell(
          radius: 0,
          borderRadius: _borderRadius,
          highlightColor: Colors.orange,
        
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return st;
    }));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
             
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    iconLocation,
                    size: 40.0,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
