import 'package:flutter/material.dart';
import 'package:innova/widgets/pill_button.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(75, 0, 0, 20),
                    child: Row(
                      children: <Widget>[
                        Hero(
                          tag: 'logo',
                          child: FlutterLogo(
                            size: 50,
                          ),
                        ),
                        Text(
                          'App Name',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PillButton(
                    title: 'Log In',
                    colour: Colors.lightBlueAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, 'login_screen');
                    },
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Register'
                    )
                  ),
                  Column (
                    children: <Widget>[
                      PillButton(
                        title: 'Register as Driver',
                        colour: Colors.lightBlueAccent,
                        onPressed: (){
                          Navigator.pushNamed(context, 'register_screen');
                        },
                      ),
                        PillButton(
                        title: 'Register as Business',
                        colour: Colors.lightBlueAccent,
                        onPressed: (){
                          Navigator.pushNamed(context, 'company_register_screen');
                        },
                      )
                    ]
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
