import 'package:flutter/material.dart';
import 'package:innova/constants/input_decoration.dart';
import 'package:innova/widgets/pill_button.dart';

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
                onPressed:() {
                  Navigator.pushNamed(context, 'company_home_screen');
                }
              )
            ]
          )
        )
      )
    );
  }
}
