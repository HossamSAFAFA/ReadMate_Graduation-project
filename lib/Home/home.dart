import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/texttospeech/texttospeech.dart';

import '../components.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  SingleChildScrollView(
      child: Container(
          padding: EdgeInsetsDirectional.only(
            top: MediaQuery.of(context).size.height*.08,
            start: MediaQuery.of(context).size.width*.04,
            end: MediaQuery.of(context).size.width*.04,
      
      
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("New Documents",style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width*.06,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF187F08)
      
                  ),),
                  SizedBox(width: MediaQuery.of(context).size.width*.3,),
                  Image(image: AssetImage("assets/images/person.png"))
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.04,),
      
              DottedBorder(
                color: Colors.black,
                dashPattern: [MediaQuery.of(context).size.height*.01, MediaQuery.of(context).size.height*.005],
                strokeWidth: 1,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height*.3,
                    padding: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).size.height*.02,
                start: MediaQuery.of(context).size.width*.02,
                end: MediaQuery.of(context).size.width*.02,
      
      
              ),
                  child:Column(
      
                  children: [
                     Image(image: AssetImage('assets/images/Upload.png')),
                     SizedBox(height: MediaQuery.of(context).size.height*.01),
                    Text("Upload your file here",style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width*.06,
                      fontWeight: FontWeight.bold,
      
                    ),),
                    SizedBox(height: MediaQuery.of(context).size.height*.04),
                    Container(
                      padding: EdgeInsetsDirectional.only(
                        start: MediaQuery.of(context).size.height*.02
                      ),
                       width:MediaQuery.of(context).size.width*.4 ,
                      height: MediaQuery.of(context).size.height*.04,
                        color: Color(0xFFD9D9D9),
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_open,
                          ),
                          MaterialButton(
                            onPressed: (){
                              Extracttext().then((value){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => text_to_speech(value)),
      
                                );
                             });
                            },
                            child: Text("Select file ",style: TextStyle(fontWeight: FontWeight.bold),),)
                        ],
                      ),
                    )
      
      
                  ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*.04,),
      
             
      
              Container(
                padding: EdgeInsetsDirectional.only(
                  start: MediaQuery.of(context).size.width*.02
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
      
                    // SizedBox(height: MediaQuery.of(context).size.height*.02,),
                    Row(
                      children: [
                        Text("Recent",style: TextStyle(fontSize: MediaQuery.of(context).size.width*.07,fontWeight: FontWeight.bold),),
                        Container(
                          width: MediaQuery.of(context).size.width*.1,
                            child: Image.asset("assets/images/Replay.png")),
                        
                      ],
                    ),
                     SizedBox(height: MediaQuery.of(context).size.height*.02,),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20), // This creates rounded corners
                          border: Border.all(
                            color: Colors.green, // Border color
                            width: 1,           // Border width
                          )),
                      height: MediaQuery.of(context).size.height*.2,
                        child:MaterialButton(
                          child:Image.asset("assets/images/report.jpg"),

                            onPressed:(){
                              ExtracttextReport().then((value){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => text_to_speech(value)),

                                );
                              });
                            }
                        )
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*.01,),
                    Row (
                      children: [
                        Icon(Icons.picture_as_pdf,color: Colors.red,),
                       SizedBox(width:MediaQuery.of(context).size.width*.02),
                        Text("report"),

                      ],
                    ) ,
                    Container(padding: EdgeInsetsDirectional.only(start:MediaQuery.of(context).size.width*.08),
                        child: Text(""))
      
                  ],
                ),
              ),
      
      
      
      
      
      
      
      
      
            ],
          ),
        ),
    );





  }
}