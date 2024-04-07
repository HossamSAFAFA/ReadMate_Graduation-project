import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/profile/profile.dart';

class text_to_speech extends StatefulWidget{
  String Extractedtext="";

  text_to_speech(String value)
  {
    Extractedtext=value;
  }


  @override
  State<text_to_speech> createState() => _text_to_speechState(Extractedtext);
}

class _text_to_speechState extends State<text_to_speech> {
  String Extractedtext="";
  List<String> lines=[];

  var Texttospeech;
  int highlightedLine = 0;
  int cheeck=1;

  _text_to_speechState(String extractedtext)
  {
    Extractedtext=extractedtext;
    Texttospeech=TextEditingController(text: Extractedtext);
    lines = Texttospeech.text.split('.');
  }


  int count=0;
  bool x=true;
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height*0.05,
          start: MediaQuery.of(context).size.width*.05,
          end:MediaQuery.of(context).size.width*.05,
        ),
        child: Container(

          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(

                  children: [
                    IconButton(icon:Icon(Icons.home,size: MediaQuery.of(context).size.width*.1,),onPressed: ()
                    {
                      Navigator.of(context).pop();
                    },),
                    SizedBox(width: MediaQuery.of(context).size.width*.6,),
                    CircleAvatar(
                      backgroundColor: Color(0xFFD9D9D9),
                      child: IconButton(icon: Icon(Icons.person,color: Colors.black,),onPressed: (


                          ){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => profile()),

                        );
                      },),
                    )

                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Container(
                    width: double.infinity,
                    height:MediaQuery.of(context).size.height*0.7
                    ,
                    padding: EdgeInsetsDirectional.only(
                      top: MediaQuery.of(context).size.height*0.02,
                      start: MediaQuery.of(context).size.width*.05,
                      end:MediaQuery.of(context).size.width*.04,),
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius:BorderRadiusDirectional.only(
                            topStart: Radius.circular(20),
                            topEnd: Radius.circular(20)
                        )
                    ),
                    child: TextFormField(
                      controller:Texttospeech ,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: _buildHighlightedLine(),
                        ),
                      ),


                    )),
                Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*.1,
                    padding: EdgeInsetsDirectional.only(

                      start: MediaQuery.of(context).size.width*.05,
                      end:MediaQuery.of(context).size.width*.04,),
                    decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadiusDirectional.only(
                          bottomEnd:Radius.circular(20),
                          bottomStart: Radius.circular(20),
                        )
                    ),
                    child:Container(
                      padding: EdgeInsetsDirectional.only(
                          start: MediaQuery.of(context).size.width*.02
                      ),
                      child: Row(
                        children: [
                          SizedBox(width:MediaQuery.of(context).size.width*.06),

                          MaterialButton(
                            onPressed: (){
                              //  print("safafaffaffafa");
                              highlightedLine--;
                              if(highlightedLine<=0)
                                {
                                  highlightedLine=1;
                                }

                              setState(() {});

                            },
                            child: Image.asset("assets/images/Undo.png"),

                          ),

                          CircleAvatar(
                              radius: MediaQuery.of(context).size.width*.08,
                              backgroundColor: Colors.black,
                              child: IconButton(
                                  onPressed: () async {

                                    if(x==true)
                                    {
                                      x=false;


                                     // for(int i=highlightedLine;highlightedLine<lines.length+1;i++)
                                      while(highlightedLine<=lines.length)
                                      {
                                        cheeck=highlightedLine;
                                        if(count==1)
                                        {
                                          break;
                                        }
                                        else
                                        {
                                          await Future.delayed(Duration(seconds: 1));
                                          highlightedLine++;
                                          setState(() {


                                            print("safafa");
                                            print(highlightedLine);
                                          });
                                        }
                                      }
                                      if(highlightedLine==lines.length+1)
                                      {
                                        highlightedLine=1;
                                        x=true;
                                        setState(() {});
                                      }

                                      count=0;


                                    }
                                    else
                                    {

                                      setState(()
                                      {
                                        x=true;
                                        count=1;
                                        print("mayar");
                                      });

                                    }




                                  }, icon: Icon(x==true?Icons.play_arrow:Icons.pause,color: Colors.white,size: MediaQuery.of(context).size.width*.1,)
                              )),
                          MaterialButton(
                            onPressed: (){
                              highlightedLine++;
                              if(highlightedLine>=lines.length)
                              {
                                highlightedLine=1;
                                x=true;
                                setState(() {});
                              }
                              setState(() {});
                            },
                            child: Image.asset("assets/images/Undoo.png"),

                          ),
                          CircleAvatar(
                              backgroundColor:Color(0xFFD9D9D9),
                              radius: MediaQuery.of(context).size.width*.06,
                              child: TextButton(onPressed: (){}, child:Text("1X",style: TextStyle(color: Colors.black,fontSize:15),))
                          ),

                        ],
                      ),
                    )

                ),









              ],
            ),
          ),
        ),
      ),

    );
  }
  Widget _buildHighlightedLine() {

    //print(lines[0]);

    return ListView.builder(


      itemCount: lines.length,
      itemBuilder: (context, index) {
        if (index == highlightedLine - 1) {
          return Container(

            // Customize the highlight color
            child: Text(
              lines[index],

              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              ),
            ),
          );
        } else {
          return Text(lines[index]);
        }
      },
    );

  }

}