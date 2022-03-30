import 'package:flutter/material.dart';

class ValveCard extends StatelessWidget {
  var gapSize = 4.0;
  var valveNo;
  var moisture1;
  var moisture2;
  var temp;
  var flow;
  var status;
  var humidity;
  var rain;
  Map data = {};
  var readingText = TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF090F13),
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                          );

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
                height: 400,
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
                      Row(
                        children: [
                        
                          Text(
                            'Valve : $valveNo  ',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                           
                        ],
                      ),

                      SizedBox(height: 15,),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Temperature : $temp°C',
                              style: readingText,
                            ),
                            SizedBox(height: gapSize,),

                            Text(
                              'Moisture Sensor 1 : $moisture1',
                              style: readingText,
                            ),
                            SizedBox(height: gapSize,),
                            Text(
                              'Moisture Sensor 2: $moisture2',
                              style: readingText,
                            ),
                            SizedBox(height: gapSize,),
                            Text(
                              'Humidity : $humidity',
                              style: readingText,
                            ),
                            SizedBox(height: gapSize,),
                            Text(
                              'Rain : $rain ',
                              style: readingText,
                            ),
                            SizedBox(height: gapSize,),
                            Text(
                              'Water Flow : $flow L ',
                              style: readingText,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Status  :  ',
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),

                                 status?Icon(Icons.circle,
                                color: Colors.green,):Container(),

                                Text('${!status?" Idle":" Running"}',
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: !status?Colors.red: Colors.green,
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                               
                              ],
                            ),

                            SizedBox(height: 4,),

                             Row(
                              children: [
                                Text('Rain  :  ',
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),

                                 status?Icon(Icons.circle,
                                color: Colors.green,):Container(),

                                Text((rain >= 4000)?" Not Raining":" Raining",
                                  style: TextStyle(
                                    fontFamily: 'Lexend Deca',
                                    color: (rain >= 4000)?Colors.red: Colors.lightBlue,
                                    fontSize: 30,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                               
                              ],
                            ),


                         
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                       ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
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
