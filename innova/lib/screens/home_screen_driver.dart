import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:innova/screens/home_screen_business.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class DriverHomeScreen extends StatefulWidget {
  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

final apiKey = 'AIzaSyCCa30P9-jhu-MNAF8GlZ1hP5nSF1Lz_jo';

class _DriverHomeScreenState extends State<DriverHomeScreen> {

  int _currentIndex = 0;
  List legs;

  final Firestore db = Firestore.instance;

  final List<Widget> _children = [
    DriverDeliveryList(),
    PlaceHolder("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
            Container (
              child: _children[_currentIndex],
            ),
            RaisedButton(
              onPressed: () async {
              await getRoute();
              Navigator.pushNamed(context, 'maps_screen', arguments: MapArgs(legs));
              },
              child: Text("Start Driving"),
            )
        ]
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

  Future<void> getRoute() async {
    DocumentSnapshot route = await db.collection('routes').document('routes').get();
    List routeList = route['route'];

    String startingAddress = routeList[0]['sourceAddress'];
    List addressStrings = [

    ];

    for (var route in routeList) {
      addressStrings.add(route['deliveryAddress']);
    }

    var addressString = "";
    for (var string in addressStrings) {
      addressString+= "$string|";
    }

    var queryUrl = 'https://maps.googleapis.com/maps/api/directions/json?origin=59+Spark+St,+Ottawa,+ON&destination=100+Louis+Pasteur+Pvt,+Ottawa+ON'
        '&key=$apiKey&waypoints=$addressString';

    var response = await http.get(queryUrl);
    var jsonBody = jsonDecode(response.body);
    legs = jsonBody['routes'][0]['legs'];

  }
}

class DriverDeliveryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue[200],
      child: ListView(
        /* TODO: get all delivery items from db for current status,
            make new DeliveryListItem for each and display */
          padding: const EdgeInsets.all(8),
          children: <Widget>[
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

class MapArgs {
  List legs;

  MapArgs(this.legs);
}
