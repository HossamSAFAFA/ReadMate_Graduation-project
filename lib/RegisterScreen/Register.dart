import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../LoginScreen/Login.dart';
import '../database.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var fullnameController = TextEditingController();
  var emaillController = TextEditingController();
  var usernameController = TextEditingController();
  var passworddController = TextEditingController();
  var confirmPasswordController = TextEditingController();


  GlobalKey<FormState> formKeyy = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DpHelper dpp =new DpHelper();
    return Scaffold(
      backgroundColor: Color(0xFFD9D9D9),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: formKeyy,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/images/Regisrerimage.png'),
                  width: double.infinity,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  "Please Fill out form to Register!",
                  style: TextStyle
                    (

                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                buildTextFormField(
                  controller: fullnameController,
                  hintText: 'First Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'First name must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                buildTextFormField(
                  controller: usernameController,
                  hintText: 'Last Name',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Last name must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                buildTextFormField(
                  controller: emaillController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email address must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                buildTextFormField(
                  controller: passworddController,
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                buildTextFormField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm password must not be empty';
                    }
                    else if(passworddController.text!=value)
                      {
                        return 'Confirm password must  be equal password';
                      }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Container(
                  padding: EdgeInsetsDirectional.only(
                      start: MediaQuery.of(context).size.width * 0.07,
                      end: MediaQuery.of(context).size.width * 0.07),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xFF40B42E),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: MaterialButton(
                      onPressed: () {
                        if (formKeyy.currentState!.validate()) {
                          // Validation passed, you can proceed with registration
                          dpp.insertToDatabase(first: fullnameController.text,last: usernameController.text,email:emaillController.text,password: passworddController.text);




                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator,
  }) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: MediaQuery.of(context).size.width * 0.07,
        end: MediaQuery.of(context).size.width * 0.07,
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.002,
            horizontal: MediaQuery.of(context).size.width * 0.06,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Color(0xFF088014)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Color(0xFF088014)),
          ),
        ),
      ),
    );
  }
}
