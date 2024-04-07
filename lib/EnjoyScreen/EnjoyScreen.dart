import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../LoginScreen/Login.dart';

class Enjoy extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
    // backgroundColor: Color(0xFF088014),

     body: Container(
       decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [Color(0xFF088014), Color(0xFF508A56)],
           begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
         ),
       ),
       width: double.infinity,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,

         children: [
         CircleAvatar(
           backgroundColor: Color(0xFF088014),
           radius: MediaQuery.of(context).size.height*.17,
           child: ClipOval(
             child: Image(

                 image: AssetImage('assets/images/Enjoy.png'),
               fit: BoxFit.fill,

             ),
           ),
         ),
           SizedBox(height: MediaQuery.of(context).size.height*.05,),
           Text(
               "Enjoy",
             style: TextStyle(
               color: Color(0xFFFFFFFF),
               fontSize: MediaQuery.of(context).size.width*.1,


             ),
           ),
           Text(
             "Y o u r  T i m e",
             style: TextStyle(
               color: Color(0xFFFFFFFF),
               fontSize: MediaQuery.of(context).size.width*.1,


             ),
           ),
           SizedBox(height: MediaQuery.of(context).size.height*.1,),
           Container(
             width:MediaQuery.of(context).size.width*.6 ,
             decoration: BoxDecoration(
               color: Color(0xFFD9D9D9),
               borderRadius: BorderRadius.circular(20)

             ),

             child: MaterialButton(onPressed: (){
               // Navigator.push(
               //   context,
               //   MaterialPageRoute(builder: (context) => login()),
               // );
               Navigator.pushAndRemoveUntil(
                   context,
                   MaterialPageRoute(builder: (context)
                   {
                     return login() ;
                   }),
                       (route)
                   {
                     return false;
                   }

               );

             },
               child: Text(
                 "Get started",
                 style: TextStyle(
                   fontSize: MediaQuery.of(context).size.width*.07,
                     color: Color(0xFF088014)
                 ),

               ),

             ),
           )




         ],

       ),
     ),



   );
  }



}