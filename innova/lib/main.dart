import 'package:flutter/material.dart';
import 'package:innova/screens/splash_screen.dart';
import 'package:innova/screens/register_screen.dart';
import 'package:innova/screens/login_screen.dart';
import 'package:innova/screens/company_registration_screen.dart';
import 'package:innova/screens/home_screen_business.dart';
import 'package:innova/screens/maps_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'maps_screen',
      routes: {
        'splash_screen': (context) => SplashScreen(),
        'login_screen': (context) => LoginScreen(),
        'register_screen': (context) => RegisterScreen(),
        'company_register_screen': (context) => CompanyRegistrationScreen(),
        'company_home_screen': (context) => BusinessHomeScreen(),
        'maps_screen': (context) => MapsScreen(),
      }
    );
  }
}