import 'package:flutter/material.dart';

class ValveCard extends StatelessWidget {
  var valveNo;
  var moisture1;
  var moisture2;
  var temp;
  var flow;
  var status;
  var humidity;
  var rain;
  Map data = {};

  ValveCard({valveNo, moisture1, moisture2, temp,status, flow, rain, humidity}) {
    this.valveNo = valveNo;
    this.moisture1 = moisture1;
    this.moisture2 = moisture2;
    this.temp = temp;
    this.status = status;
    this.flow = flow;
    this.humidity = humidity;
    this.rain = rain;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x25000000),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
              child: Container(
                width: 4,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 12, 16, 12),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Valve : $valveNo',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF090F13),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'Temperature : $temp°C \nMoisture Sensor 1 : $moisture1 \nMoisture Sensor 2: $moisture2\nHumidity : $humidity\nRain : $rain\nWater Flow : $flow L ',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF090F13),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'Status : $status',
                          style: TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Colors.redAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                       ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/valve.webp',
                        height: 100.0,
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
