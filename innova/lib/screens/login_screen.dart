import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innova/constants/input_decoration.dart';
import 'package:innova/screens/home_screen_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email;
  String password;
  String passwordConfirm;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
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
              SizedBox(
                height: 10
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  decoration: InputDecorationWrapper(hint: 'email').getInputDecoration(),
                  onChanged: (value) {
                    email = value;
                  }
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                obscureText: false,
                textAlign: TextAlign.center,
                decoration: InputDecorationWrapper(hint: 'password').getInputDecoration(),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0, color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () async {
                        try {
                          final firebaseUser = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);

                          var document = await db.collection('users').document('users').collection('drivers').document(firebaseUser.user.uid).get();
                          var userType = document.data['userType'];
                          if (firebaseUser != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreenController(userType: userType)
                                ));
                          }
                        } catch (e) {
                          print(e);
                        }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Login',
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
class Arguments {

  final String email;

  Arguments(this.email);

}
