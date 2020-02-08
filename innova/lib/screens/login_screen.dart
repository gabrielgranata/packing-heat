import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:innova/constants/input_decoration.dart';
import 'package:innova/screens/home_screen_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email;
  String password;
  String passwordConfirm;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                  elevation: 5.0, color: Colors.blue,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () async {

                      if (password != passwordConfirm) {
                        print('passwords dont match');
                      } else {
                        try {
                          final firebaseUser = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password);
                          if (firebaseUser != null) {

                            // TODO: POST REQUEST TO DB TO ADD USER
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreenController(userType: 'business')
                                ));
                            Navigator.pushNamed(context, 'home_screen', arguments: Arguments(email));
                          }
                        } catch (e) {
                          print(e);
                        }
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
