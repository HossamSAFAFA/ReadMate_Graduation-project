import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:graduation_project/translate/translate.dart';
import 'package:image_picker/image_picker.dart';

import '../texttospeech/texttospeech.dart';

class camera extends StatefulWidget{
  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  @override
  late ImageProvider<Object> _image = const AssetImage('assets/images/exampletext.png'); // Provide initial value here
  String text = '';
  Future textRecognition(File img) async{
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final inputImage = InputImage.fromFilePath(img.path);
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    setState(() {
      text = recognizedText.text;
    });
  }
  void pickImage() async {
    var picker = ImagePicker();
    var pickedImage = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        _image = FileImage(File(pickedImage.path));

        textRecognition(File(pickedImage.path));
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  void initState() {
    super.initState();

   pickImage();

  }



  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height*.15
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Choose Option",style: TextStyle(fontWeight: FontWeight.bold,fontSize:
            MediaQuery.of(context).size.width*.08
            ),),
            SizedBox(height:MediaQuery.of(context).size.height*.1,),
           MaterialButton(onPressed: ()
               {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => text_to_speech(text)),

                 );
               },
             child:  Image.asset("assets/images/texttospeech.png")),
            SizedBox(height:MediaQuery.of(context).size.height*.02,),
            Text("Text to speech",style: TextStyle(fontWeight: FontWeight.w600),),
            SizedBox(height:MediaQuery.of(context).size.height*.1,),
             MaterialButton(onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TranslateWidget(text)),

                );
              },
                  child:  Image.asset("assets/images/translation.png")),


            SizedBox(height:MediaQuery.of(context).size.height*.01,),
            Text("Translation",style: TextStyle(fontWeight: FontWeight.w600),),


          ],
        ),
      ),
    );

  }
}