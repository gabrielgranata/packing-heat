import 'package:flutter/material.dart';

class BusinessHomeScreen extends StatefulWidget {
  @override
  _BusinessHomeScreenState createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceHolder("Deliveries"),
    PlaceHolder("Messages"),
    PlaceHolder("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Deliveries'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person),
              title: new Text('Profile')
          )
        ],
      ),
    );
  }
}

class PlaceHolder extends StatelessWidget {

  PlaceHolder(this.title);

//  final Color colour;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text.rich(
         TextSpan(
           style: TextStyle(color: Colors.black.withOpacity(1.0)),
           text: title,
         )
        )
    );
  }
}
