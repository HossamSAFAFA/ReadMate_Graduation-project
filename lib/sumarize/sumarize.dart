import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components.dart';
import '../texttospeech/texttospeech.dart';

class sumarize extends StatefulWidget{
  @override
  State<sumarize> createState() => _sumarizeState();
}

class _sumarizeState extends State<sumarize> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController texttController = TextEditingController();
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Summrization",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * .08,
                  color: Color(0xFF187F08)
              ),

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFFD9D9D9),
                  ),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: TextFormField(
                    controller: texttController,
                    keyboardType: TextInputType.text,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: "Insert text",
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                      ),
                    ),

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                      Extracttext().then((value){
                        texttController.text = value;
                      });

                    }, icon:   Icon(Icons.picture_as_pdf),color: Colors.red,),
                    IconButton( icon: Icon(Icons.volume_up),onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => text_to_speech(texttController.text)),

                      );

                    },)
                  ],
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            Container(
              padding: EdgeInsetsDirectional.only(
                start: MediaQuery.of(context).size.width*.05,
                top: MediaQuery.of(context).size.height*.02,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(20),
                    bottomEnd: Radius.circular(20),
                    topEnd: Radius.circular(20),
                    topStart: Radius.circular(20),
                ),

                color: Color(0xFFD9D9D9),

              ),
              child: Text("Summrize."),

            ),
          ],
        ),
      ),
    );
  }
}