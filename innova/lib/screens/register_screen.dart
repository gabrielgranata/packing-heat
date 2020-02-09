import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innova/constants/input_decoration.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:innova/widgets/pill_button.dart';

enum UserType {
  driver,
  business
}

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String email;
  String password;
  String firstName;
  String lastName;
  String passwordConfirm;
  UserType userType = UserType.business;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore db = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text.rich(
                  TextSpan(
                      text: 'Register as driver',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                  )
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 5, 0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecorationWrapper(hint: 'First Name').getInputDecoration(),
                      onChanged: (value) {
                        firstName = value;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(5, 15, 15, 0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecorationWrapper(hint: 'Last Name').getInputDecoration(),
                      onChanged: (value) {
                        lastName = value;
                      },
                    ),
                  ),
                ),
              ]),
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecorationWrapper(hint: 'Email').getInputDecoration(),
                    onChanged: (value) {
                      email = value;
                    }),
              ),
              Container (
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: TextField(
                  obscureText: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecorationWrapper(hint: 'Password').getInputDecoration(),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              Container (
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: TextField(
                  obscureText: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecorationWrapper(hint: 'Confirm password').getInputDecoration(),
                  onChanged: (value) {
                    setState(() {
                      passwordConfirm = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: PillButton(
                    title: 'Register',
                    colour: Colors.lightBlueAccent,
                    onPressed: () async {
                      try {
                        final firebaseUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email.trim(), password: password);

                                var postData = {
                                  "email": email,
                                  "firstName": firstName,
                                  "lastName": lastName,
                                  "userType": 'driver'
                                };

                                db.collection('users').document('users').collection('drivers').document(firebaseUser.user.uid).setData(postData);
                        if (firebaseUser != null) {
                          Navigator.pushNamed(context, 'driver_home_screen');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
