import 'package:flutter/material.dart';


class MoistureCard extends StatefulWidget {
  int valveNo = 0;
  int moisture1 = 0;
  int moisture2 = 0;

  MoistureCard({valveNo, moisture1, moisture2}) {
    this.valveNo = valveNo;
    this.moisture1 = moisture1;
    this.moisture2 = moisture2;
  }

  @override
  State<MoistureCard> createState() => _MoistureCardState();
}

class _MoistureCardState extends State<MoistureCard> {

  

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
                        'Valve : ${widget.valveNo}',
                        style: TextStyle(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF090F13),
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          '\nMoisture Sensor 1 : ${widget.moisture1} \nMoisture Sensor 2: ${widget.moisture2}\n ',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF090F13),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),                    
                       
                      SizedBox(height: 10.0),
                       ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/moist-logo.png',
                        height: 80.0,
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
