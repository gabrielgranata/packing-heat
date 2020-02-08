import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:innova/constants/input_decoration.dart';

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
  UserType userType = UserType.business;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: FlutterLogo(
                    size: 150,
                  ),
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
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
                    margin: EdgeInsets.only(left: 10),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecorationWrapper(hint: 'Password').getInputDecoration(),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                        leading: Radio(
                          value: UserType.business,
                          groupValue: userType,
                          onChanged: (UserType value) {
                            setState(() {
                              userType = value;
                            });
                          },
                        ),
                      title: Text(
                        'Business'
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                        leading: Radio(
                          value: UserType.driver,
                          groupValue: userType,
                          onChanged: (UserType value) {
                            setState(() {
                              userType = value;
                            });
                          },
                        ),
                      title: Text(
                        'Driver'
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        final firebaseUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email.trim(), password: password);

                        if (firebaseUser != null) {
                          Navigator.pushNamed(context, 'homeScreen');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
