import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/LoginScreen/Login.dart';
import 'package:graduation_project/components.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(
            top: MediaQuery.of(context).size.height * .09,
            start: MediaQuery.of(context).size.width * .07,
            end: MediaQuery.of(context).size.width * .07),
        child: Column(
          children: [
            Text(
              'Account',
              style: TextStyle(
                  color: Color(0xFF40B42E),
                  fontSize: MediaQuery.of(context).size.width * .07),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            CircleAvatar(
              radius: MediaQuery.of(context).size.width * .15,
              backgroundColor:Color(0xFF40B42E),
              child: Text(
                Email[0].toUpperCase(),
                style: TextStyle(color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width*.2
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Text(Email),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            Row(
               mainAxisAlignment:MainAxisAlignment.center,
               children: [
                 Container(
                   color: Color(0xFFD9D9D9),
                   child: MaterialButton(
                     onPressed: (){
      
                     },
                     child: Text("Edit ",style: TextStyle(fontWeight: FontWeight.bold),),),
                 ),
                 SizedBox(width: MediaQuery.of(context).size.width*.07),
                 Container(
                   color: Color(0xFFD9D9D9),
                   child: MaterialButton(
                     onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => login()),
      
                       );
                          },
      
                     child: Text("Logout ",style: TextStyle(fontWeight: FontWeight.bold),),),
                 )
               ],
      
            )
          ],
        ),
      ),
    );
  }
}
