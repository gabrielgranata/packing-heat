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
    DriverDeliveryList(),
    PlaceHolder("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:
            Container (
              child: _children[_currentIndex],
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
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

}

class DriverDeliveryList extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.lightBlue[200],
      child: ListView (
        /* TODO: get all delivery items from db for current status,
            make new DeliveryListItem for each and display */
          padding: const EdgeInsets.all(8),
          children: <Widget> [
            Container(
              margin: EdgeInsets.fromLTRB(15, 50, 15, 10),
              child: Text.rich(
                TextSpan(
                  text: 'Available delivery jobs',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            DriverDeliveryListItem(13.23, 5.00, 2.3, "Small Box"),
            DriverDeliveryListItem(15.00, 5.00, 2.3, "Large Box"),
           ]
      ),
    );
  }
}

class DriverDeliveryListItem extends StatelessWidget {

  DriverDeliveryListItem(
      this.rateForDelivery,
      this.weight,
      this.volume,
      this.itemType,
      );

  final double rateForDelivery;
  final double weight;
  final double volume;
  final String itemType;

  @override
  Widget build(BuildContext context) {
    return
      Container (
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        height: 75,
        margin: const EdgeInsets.fromLTRB(5, 5, 5, 10),
        child:  Row (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              Text ('$itemType'),
              Text ('Rate: $rateForDelivery')
            ]
        ),
      );

  }
}

