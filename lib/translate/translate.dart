import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

import '../texttospeech/texttospeech.dart';

class TranslateWidget extends StatefulWidget {
  @override

  String translate="";

  TranslateWidget(String value)
  {
    translate=value;
  }
  State<TranslateWidget> createState() => _TranslateWidgetState(translate);
}

class _TranslateWidgetState extends State<TranslateWidget> {
  List<String> languages = [
    "Arabic",
    "German",
    "Italian",
    "Spanish",
    "English"
  ]; // Added Spanish as an example
  String? selectedLanguage =
      "Arabic"; // Changed variable name to selectedLanguage
  String translatedText = "";
  String translatedTextt = "";
  String code = "ar";
  late TextEditingController  textController ;
  _TranslateWidgetState(String extractedtext)
  {
    translatedText=extractedtext;
    textController=TextEditingController(text: translatedText);

  }

  final GoogleTranslator _translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
          vertical: MediaQuery.of(context).size.height * 0.05,
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsetsDirectional.only(
              top: MediaQuery.of(context).size.height*.03
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Translation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: MediaQuery.of(context).size.width * .08),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                    start: MediaQuery.of(context).size.width*.07
                  ),
                  child: Row(
                    children: [
                      Text("Auto",
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05),
                      ),
                      SizedBox(
                        width:  MediaQuery.of(context).size.width*.08,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*.07,
                          child: Image.asset("assets/images/arrow.png")
                      ),
                      SizedBox(
                        width:  MediaQuery.of(context).size.width*.08,
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width * 0.51,
                        // height: MediaQuery.of(context).size.height * 0.04,
                        // decoration: BoxDecoration(border: Border.all()
                        //
                        //   // color: Color(0xFFD9D9D9),
                        // ),
                        child: DropdownButton<String>(
                          icon: Container(
                            padding: EdgeInsetsDirectional.only(
                               // start: MediaQuery.of(context).size.width*.2
                            ),
                            child: Container(

                              child: Icon(
                                  Icons.arrow_drop_down,
                                  size: MediaQuery.of(context).size.width * .08,
                                  color: Colors.black87
                              ),
                              decoration: BoxDecoration(


                              ),
                            ),
                          ),
                          value: selectedLanguage,
                          items: languages.map((String language) {
                            return DropdownMenuItem<String>(
                              value: language,
                              child: Text(
                                language,
                                style: TextStyle(
                                  //  color: Colors.black,
                                    fontSize: MediaQuery.of(context).size.width * .05,
                                    fontWeight: FontWeight.w500),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedLanguage = newValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
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
                        controller: textController,
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
                        // onChanged: (value) {
                        //   if (selectedLanguage == 'Arabic') {
                        //     code = "ar";
                        //   } else if (selectedLanguage == 'German') {
                        //     code = "de";
                        //   } else if (selectedLanguage == 'Italian') {
                        //     code = "it";
                        //   } else if (selectedLanguage == 'English') {
                        //     code = "en";
                        //   } else {
                        //     code = "es";
                        //   }
                        //   // Call the translate function when the button is pressed
                        //   translate(code, value);
                        // },
                      ),
                    ),
                    IconButton( icon: Icon(Icons.volume_up),onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => text_to_speech(textController.text)),

                      );

                    },)
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
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(20),
                      bottomEnd: Radius.circular(20),
                      topEnd: Radius.circular(20),
                      topStart: Radius.circular(20),
                    ),

                    color: Color(0xFFD9D9D9),

                  ),
                  child: SingleChildScrollView(child:
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: MediaQuery.of(context).size.width*.01,
                      end: MediaQuery.of(context).size.width*.01,

                    ),
                      child: Text(translatedTextt))),

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(

                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
                    color: Colors.green,
                  ),

                  child: MaterialButton(onPressed: (){
                    if (selectedLanguage == 'Arabic') {
                      code = "ar";
                    } else if (selectedLanguage == 'German') {
                      code = "de";
                    } else if (selectedLanguage == 'Italian') {
                      code = "it";
                    } else if (selectedLanguage == 'English') {
                      code = "en";
                    } else {
                      code = "es";
                    }
                    // Call the translate function when the button is pressed
                    translate(code, textController.text);
                  },
                    child: Text("Translate",
                    style: TextStyle(
                      color: Colors.white
                    ),

                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> translate(code, text) async {
    try {
      // Get the text from the input field
      String textToTranslate = text;

      // Perform the translation
      Translation translation =
      await _translator.translate(textToTranslate, to: code);
      String translatedTextt = translation.text;

      // Update the state to reflect the translated text
      setState(() {
        this.translatedTextt = translatedTextt;
      });
    } catch (e) {
      print('Translation failed: $e');
    }
  }
}