import 'package:email_password_login/model/log_model.dart';
import 'package:flutter/material.dart';

class LogCard extends StatelessWidget {
final LogModel log ;
var gapSize = 6.0;
 var readingText = TextStyle(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF090F13),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          );
 
                           

  LogCard({required this.log}); 
    

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
                height: 200,
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
                            'User : ${log.email}',
                            style: TextStyle(
                              fontFamily: 'Lexend Deca',
                              color: Colors.black,
                              fontSize: 20,
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
                              'Action : ${log.action}',
                              style: readingText,

                            ),
                            SizedBox(height: gapSize,),

                            Text(
                              'Time : ${log.time}',
                              style: readingText,
                            ),
                            SizedBox(height: gapSize,),
                            Text(
                              'Ipv4: ${log.ipv4}',
                              style: readingText,
                            ),
                            SizedBox(height: gapSize,),
                            Text(
                              'Ipv6 : ${log.ipv64}',
                              style: readingText,
                            ),
                            SizedBox(height: gapSize,),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
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
