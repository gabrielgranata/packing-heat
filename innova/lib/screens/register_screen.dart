import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innova/constants/input_decoration.dart';
import 'package:http/http.dart' as http;

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
              Text.rich(
                  TextSpan(
                      text: 'Register as driver'
                  )
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
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: false,
                textAlign: TextAlign.center,
                decoration: InputDecorationWrapper(hint: 'confirm password').getInputDecoration(),
                onChanged: (value) {
                  setState(() {
                    passwordConfirm = value;
                  });
                },
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
                            var url = 'http://uottahack2020.herokuapp.com/users/'
                                'drivers?email=$email&firstName=$firstName&lastName=$lastName&userType=$userType&uid=${firebaseUser.user.uid}';
                            var response = await http.post(
                                url,
                                body: {
                                  'email': email,
                                  'firstName': firstName,
                                  'lastName': lastName,
                                  'userType': userType.toString()
                                }
                            );
                            print(response.statusCode);
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
