import 'package:flutter/material.dart';
import 'package:innova/screens/home_screen_controller.dart';
import 'package:innova/screens/splash_screen.dart';
import 'package:innova/screens/register_screen.dart';
import 'package:innova/screens/login_screen.dart';
import 'package:innova/screens/company_registration_screen.dart';
import 'package:innova/screens/home_screen_business.dart';
import 'package:innova/screens/new_delivery.dart';
import 'package:innova/screens/home_screen_driver.dart';
import 'package:innova/screens/maps_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'company_home_screen',
      routes: {
        'splash_screen': (context) => SplashScreen(),
        'login_screen': (context) => LoginScreen(),
        'register_screen': (context) => RegisterScreen(),
        'company_register_screen': (context) => CompanyRegistrationScreen(),
        'company_home_screen': (context) => BusinessHomeScreen(),
        'new_delivery': (context) => NewDeliveryForm(),
        'driver_home_screen': (context) => DriverHomeScreen(),
        'maps_screen': (context) => MapsScreen(),
        'home_screen': (context) => HomeScreenController(),
      }
    );
  }
}