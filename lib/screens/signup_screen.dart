import 'package:firebase_setup/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_setup/reusable_widgets/reusable_widgets.dart';
import 'package:firebase_setup/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFF005894),
          Color(0xFF005894),
          Color(0xFF276FA0).withOpacity(0.9),
          Color(0xFF276FA0).withOpacity(0.9)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 470,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 15),
                      logoWidget("assets/images/nustBlueLogo.png", 83, 83),
                      SizedBox(height: 15),
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF005894),
                          fontFamily: "Cupertino",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 23),
                      resuableTextField("Name", Icons.person_2_outlined, false,
                          _userNameTextController),
                      SizedBox(height: 10),
                      resuableTextField("Email", Icons.email_outlined, false,
                          _emailTextController),
                      SizedBox(height: 10),
                      resuableTextField("Password", Icons.password_outlined,
                          true, _passwordTextController),
                      SizedBox(height: 40),
                      blueButton(context, "SIGN UP", () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }).onError((error, stackTrace) {
                          print("Error Occured while signing in");
                        });
                      }),
                      Container(
                          child: Center(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 60,
                            ),
                            Text("Already a member?"),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()));
                              },
                              child: Text(
                                " Sign In",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF276FA0)),
                              ),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
