import 'package:flutter/material.dart';
import 'package:innova/screens/home_screen_business.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class DriverHomeScreen extends StatefulWidget {
  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {

  int _currentIndex = 0;

  final List<Widget> _children = [
    DeliveryView(),
    PlaceHolder("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container (
              child: _children[_currentIndex],
            ),
          )
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
//          getData();
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.assignment),
            title: new Text('Delivery Jobs'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profile')
          )
        ]
      ),
    );
  }

  void getData(){
//    print(Firestore.instance.collection('items').snapshots());
  }

}
