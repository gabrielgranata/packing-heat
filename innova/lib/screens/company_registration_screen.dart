import 'package:flutter/material.dart';
import 'package:innova/constants/input_decoration.dart';
import 'package:innova/widgets/pill_button.dart';
import 'package:http/http.dart' as http;
import 'package:innova/widgets/pill_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:innova/screens/home_screen_controller.dart';

enum UserType {
  driver,
  business
}
class CompanyRegistrationScreen extends StatefulWidget {
  @override
  _CompanyRegistrationScreenState createState() => _CompanyRegistrationScreenState();
}

class _CompanyRegistrationScreenState extends State<CompanyRegistrationScreen> {

  String companyName;
  String companyEmail;
  String addressLine1;
  String addressLine2;
  String phoneNumber;
  String password;
  UserType userType = UserType.business;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text.rich(
                TextSpan(
                  text: 'Register your company',
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 10),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecorationWrapper(
                        hint: 'Company Name',
                    ).getInputDecoration(),
                    onChanged: (value) {
                      companyName = value;
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecorationWrapper(hint: 'Company Email').getInputDecoration(),
                    onChanged: (value) {
                      companyEmail = value;
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
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecorationWrapper(hint: 'Address line 1').getInputDecoration(),
                    onChanged: (value) {
                      addressLine1 = value;
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 10),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecorationWrapper(hint: 'Address line 2').getInputDecoration(),
                    onChanged: (value) {
                      addressLine2 = value;
                    }),
              ),
              PillButton(
                title: 'Register',
                colour: Colors.lightBlueAccent,
                onPressed:() async {
                    try {
                      final firebaseUser = await _auth.createUserWithEmailAndPassword(email: companyEmail.trim(), password: password);
                      var url = 'http://uottahack2020.heroku.com/users/'
                          'business?email=$companyEmail&name=$companyName&userType=$userType&uid=${firebaseUser.user.uid}';
                      var response = await http.post(
                          url,
                          body: {
                            'email': companyEmail,
                            'name': companyName,
                            'userType': userType.toString()
                          }
                      );
                      print(response.statusCode);
                      if (firebaseUser != null) {
                        // Navigator.pushNamed(context, 'homeScreen');
                        // TODO: POST REQUEST TO DB TO ADD USER
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreenController(userType: 'business')
                            ));
                       // Navigator.pushNamed(context, 'home_screen', arguments: Arguments(companyEmail));
                        Navigator.pushNamed(context, 'company_home_screen');
                      }
                    } catch (e) {
                      print(e);
                    }


                }
              )
            ]
          )
        )
      )
    );
  }
}