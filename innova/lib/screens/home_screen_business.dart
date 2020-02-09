import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:innova/widgets/pill_button.dart';

class BusinessHomeScreen extends StatefulWidget {
  @override
  _BusinessHomeScreenState createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    DeliveryView(),
    PlaceHolder("Messages"),
    PlaceHolder("Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Container(
           margin: EdgeInsets.only(top: 100.0),
           child: PillButton(
             colour: Colors.deepOrange[200],
             title: 'New Delivery',
             onPressed: () {
               Navigator.pushNamed(context, 'new_delivery');
             },
           ),
          ),
          Expanded(
            child: Container (
              child: _children[_currentIndex],
            ),
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

class DeliveryView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SafeArea(
        child: Padding (
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: CarouselSlider(
            height: 600.0,
            enableInfiniteScroll: false,
            initialPage: 1,
            items: [DeliveryList(0), DeliveryList(1), DeliveryList(2)].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.blue[200]
                      ),
                      child: DeliveryList(0)
                  );
                },
              );
            }).toList(),
        )
      )
      )
    );
  }
}

class DeliveryList extends StatelessWidget {

  DeliveryList(this.currentIndex);

  final int currentIndex;

  @override
  Widget build(BuildContext context){
    return ListView (
      /* TODO: get all delivery items from db for current status,
          make new DeliveryListItem for each and display */
      padding: const EdgeInsets.all(8),
      children: <Widget> [
//        Text(
//          if()
//        ),
        DeliveryListItem("new", "1aerb2d", new DateTime(2020, 01, 01),
          new DateTime(2020, 01, 01), 13.23, 5.00, 2.3, "box", "fred"),
        DeliveryListItem("in progress", "sdkf3b2d", new DateTime(2030, 01, 01),
            new DateTime(2020, 01, 01), 4.99, 1.3, 6.0, "box", "susie"),
        DeliveryListItem("completed", "1b2rb2d", new DateTime(2020, 01, 01),
            new DateTime(2020, 01, 01), 1.32, 18.9, 6.0, "box", "bobo")
      ]
    );
  }
}

class DeliveryListItem extends StatelessWidget {

  DeliveryListItem(
      this.status,
      this.trackingNumber,
      this.dateRequested,
      this.datePickedUp,
      this.rateForDelivery,
      this.weight,
      this.volume,
      this.itemType,
      this.deliveryPerson
  );

  final String status;
  final String trackingNumber;
  final DateTime dateRequested;
  final DateTime datePickedUp;
  final double rateForDelivery;
  final double weight;
  final double volume;
  final String itemType;
  final String deliveryPerson; //TODO: Later change to class DeliveryPerson

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
            Text ('$trackingNumber'),
            Text ('$dateRequested'),
            Text ('$deliveryPerson')
          ]
        ),
      );

  }
}
