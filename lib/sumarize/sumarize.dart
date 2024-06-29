import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components.dart';
import '../texttospeech/texttospeech.dart';

class sumarize extends StatefulWidget{
  @override
  State<sumarize> createState() => _sumarizeState();
}

class _sumarizeState extends State<sumarize> {
  String x="summarized text";
  final TextEditingController texttController = TextEditingController();
  bool isSummarized = true;
  @override
  Widget build(BuildContext context) {

    //String tt="A 38-year-old woman in the US, who was apprehended twice for allegedly trying to jump the White House fence last week, has been arrested for scaling a fence at the Treasury Building.Marci Anderson Wahl of Everett, Washington, was arrested after an alarm sounded at about 2:15 am yesterday when she scaled a fence at the Treasury Building, next to the White House. Police said Wahl has told them she was there to speak to US President Donald Trump, the CNN reported. She was charged with unlawful entry and contempt of court. Wahl was first arrested on March 21 last week for trying to jump the White House fence.Once in custody, it was determined that Wahl had been issued a stay away order for the White House complex after the incident. On March 21, officers saw Wahl walking and staring at the White House complex before discovering she had jumped a fence on the south side but got stuck. Officers found her hanging from the inside of the fence by her shoelaces, which were caught on top of the fence, according to a police report. She was re-arrested on March 24 after officers saw her near Lafayette Park. She was released on her own recognisance after a Saturday court appearance. In the incident, Wahl was charged with contempt of court in violation of a stay away order. She pleaded not guilty last Saturday and was again released on her ownrecognisance.";

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.1,
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Summarization",
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
              height: MediaQuery.of(context).size.height * 0.37,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(20),
                  bottomEnd: Radius.circular(20),
                  topEnd: Radius.circular(20),
                  topStart: Radius.circular(20),
                ),

                color: Color(0xFFD9D9D9),

              ),
              child: Text(x),

            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ConditionalBuilder(
              condition: isSummarized,
              builder: (context){return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFF40B42E),
                    borderRadius: BorderRadius.circular(20.0)),
                child: MaterialButton(
                  onPressed: ()async{
                    print(texttController);
                    setState(() {
                      isSummarized=!isSummarized;
                    });
                    await summarizeText(texttController.text).then((value){
                      x=value;
                    });
                    setState(() {
                      isSummarized=!isSummarized;
                    });
                  },
                  child: Text("Summarize",
                    style: TextStyle(
                        color: Colors.white
                    ),

                  ),
                ),
              );},
              fallback: (context) => Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.green,
                ),
              )),
            )

          ],
        ),
      ),
    );
    x="Summrize";
  }
  String cleanText(String text) {
    return text;
  }
}