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
  final Firestore db = Firestore.instance;

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
          ),
          RaisedButton(
            onPressed: () async {
              await getRoute();
              Navigator.pushNamed(context, 'maps_screen');
            },
            child: Text("Start Driving"),
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

  Future<void> getRoute() async {
    DocumentSnapshot route = await db.collection('routes').document('route').get();
    List routeList = route['routes'];

    String startingAddress = routeList[0]['sourceAddress'];
    List addressStrings = [

    ];

    for (var route in routeList) {
      addressStrings.add(route['deliveryAddress']);
    }

    var queryUrl = 'https://maps.googleapis.com/maps/api/directions/json?origin=$startingAddress&destination=${addressStrings[addressStrings.length-1]}'
        '&key=$apiKey&waypoints=$addressStrings';

    var response = await http.get(queryUrl);
    print(response.body);
  }

}
