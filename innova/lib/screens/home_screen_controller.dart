import 'package:flutter/material.dart';
import 'package:innova/screens/home_screen_business.dart';
import 'package:innova/screens/home_screen_driver.dart';
import 'package:innova/screens/login_screen.dart';

class HomeScreenController extends StatelessWidget {

  HomeScreenController({@required this.userType});

  String userType;

  @override
  Widget build(BuildContext context) {

    if (userType == 'business') {
      return BusinessHomeScreen();
    } else if (userType == 'driver') {
      return DriverHomeScreen();
    } else {
      return Container();
    }

  }
}


// TODO: LOTS ON THIS PAGE..
// grab user data
// do something w it (not sure yet)
//
//class HomeScreen extends StatelessWidget {
//
//
//  @override
//  Widget build(BuildContext context) {
//
//    Arguments args = ModalRoute.of(context).settings.arguments;
//    String email = args.email;
//
//    return Scaffold(
//      body: Container(
//        child: Center(
//          child: Text(
//              'Welcome back $email!'
//          ),
//        ),
//      ),
//    );
//  }
//}