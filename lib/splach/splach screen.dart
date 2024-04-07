import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splach extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(

        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF088014), Color(0xFF508A56)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Text(
              "Read mate",
              style: TextStyle(
                color: Colors.white,

              ),
            ),
          ),
        ),

      );
  }



}