

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../RegisterScreen/Register.dart';
import '../components.dart';
import '../database.dart';
import '../layoutscreen/layout.dart';

class login extends StatefulWidget{
  @override
  State<login> createState() => _loginState();
}
Icon x=Icon(Icons.visibility_off);
bool passwordvisible=true;
var emailController=TextEditingController(text: "");

var passwordController=TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();


class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {

    DpHelper dp =new DpHelper();
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: Container(
        width: double.infinity,
        padding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height*.2,
          start: MediaQuery.of(context).size.width*.1,
            end:  MediaQuery.of(context).size.width*.1
        ),
        child: SingleChildScrollView(
          child: Form(
            key:formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*.38,
                  height: MediaQuery.of(context).size.height*.15,

                   child: Image.asset("assets/images/login.png")

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.05,
                ),
                Text(
                  'Sign in your account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width*.05

                  ),

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.05,
                ),
                TextFormField(
                    controller: emailController,

                    keyboardType: TextInputType.emailAddress
                    ,decoration: InputDecoration(
                    hintText: 'Email',

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Color(0xFF088014)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Color(0xFF088014)), // Set the focused border color
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color:Color(0xFF088014),
                    )
                ),
                      validator: (value)
                        {
                    if(value!.isEmpty)
                      {
                        return('email must not be empty');
                      }
                    return null;

                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.05,
                ),
                TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passwordvisible,
                    validator: (value)
                    {
                      if(value!.isEmpty)
                      {
                        return('password must not be empty');
                      }
                      return null;

                    },

                   decoration: InputDecoration(
                    hintText: 'Password',

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Color(0xFF088014)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Color(0xFF088014)), // Set the focused border color
                    ),
                    prefixIcon: Icon(
                      Icons.key_sharp,
                      color:Color(0xFF088014),
                    ),
                   suffixIcon: IconButton(

                         icon:Icon(passwordvisible?Icons.visibility_off:Icons.visibility) ,
                         onPressed: ()
                         {
                           setState(() {
                             passwordvisible=!passwordvisible;
                             //  x=Icon(Icons.vi)


                           });

                         },


                       )

                )
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.05,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF40B42E),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: MaterialButton(
                      onPressed: (){
                        String getpass="";
                    print(emailController);
                        if (formKey.currentState!.validate()) {
                          // Form is valid, proceed with the password retrieval
                          dp.getPasswordByEmail(emailController.text).then((String? password) {
                            String getpass = password ?? ''; // Use a default value or handle null as needed
                            print(getpass);

                            // Check if the entered password matches the retrieved password
                            if (getpass == passwordController.text) {
                              print("Passwords match");
                              // Navigate to the next screen
                              Email=emailController.text;
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context)
                                  {
                                    return Layout() ;
                                  }),
                                      (route)
                                  {
                                    return false;
                                  }

                              );
                            } else {
                              print("Passwords do not match");

                              Fluttertoast.showToast(
                                msg: 'Passwords do not match',

                                toastLength: Toast.LENGTH_LONG, // Duration for which the toast should be visible
                                gravity: ToastGravity.BOTTOM, // Position of the toast on the screen
                                timeInSecForIosWeb: 2, // Time for iOS
                                backgroundColor:  Color(0xFFD9D9D9),
                                textColor: Colors.black,
                                fontSize: 16.0,
                              );
                            }
                          });
                        }
                      },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't  have an account?",
                    style:TextStyle(

                    )
                      ),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    }, child: Text(
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black

                      ),
                    ))

                  ],

                )













              ],
            ),
          ),
        ),
      ),

    );

  }
}