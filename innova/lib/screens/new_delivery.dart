import 'package:flutter/material.dart';
import 'package:innova/constants/input_decoration.dart';
import 'package:innova/widgets/pill_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as Math;
import 'package:cloud_firestore/cloud_firestore.dart';

class NewDeliveryForm extends StatelessWidget {
  String status;
  int trackingNumber;
  DateTime dateRequested;
  DateTime datePickedUp;
  double rateForDelivery;

  double weight;
  double volume;
  String itemType;
  String deliveryPerson;
  String sourceAddress;
  String deliveryAddress;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  text: 'Request a new delivery'
                ),
              ),
              TextField(
                decoration: InputDecorationWrapper(hint: 'Item type').getInputDecoration(),
                onChanged: (value) {
                  itemType = value;
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecorationWrapper(hint: 'Weight').getInputDecoration(),
                onChanged: (value) {
                  weight = double.parse(value);
                  print(weight is double);
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecorationWrapper(hint: 'Volume').getInputDecoration(),
                onChanged: (value) {
                  volume = double.parse(value);
                  print(volume is double);
                },
              ),
              TextField(
                decoration: InputDecorationWrapper(hint: 'Source address').getInputDecoration(),
                onChanged: (value) {
                  sourceAddress = value;
                },
              ),
              TextField(
                decoration: InputDecorationWrapper(hint: 'Delivery address').getInputDecoration(),
                onChanged: (value) {
                  deliveryAddress = value;
                },
              ),
              PillButton(
                title: 'Create request',
                colour: Colors.deepOrange[200],
                onPressed: () async {
//                  Navigator.pushNamed(context, 'company_home_screen');

//                    var response = await http.post(
//                      url,
//                      body: json.encode({
//                        "status": "new",
//                        "trackingNumber" : 12345, //TODO: generate tracking num
//                        "dateRequested" : DateTime.now().millisecondsSinceEpoch,
//                        "datePickedUp" : DateTime.now().millisecondsSinceEpoch,
//                        "weight" : this.weight,
//                        "volume" : this.volume,
//                        "itemType" : this.itemType,
//                        "rateForDelivery" : 1.99, //TODO: calculate based on weight/vol
//                        "deliveryPerson" : "henry",
//                        "sourceAddy" : this.sourceAddress,
//                        "deliveryAddr" : this.deliveryAddress
//                      })
//                    );
//                    print(response.statusCode);
                    var res = await postItem();
                }
              )
            ]
          )
        )
      )
    );
  }

  String getNextTrackingNumber(){
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < 25; i++)
      text += possible.indexOf(Math.floor(Math.random() * possible.length));

    return text;
  }

  void postItem(){
    // var url = 'http://10.196.26.249:3000/items/';
    Firestore.instance.collection('delivery').document().set({
      "status": "new",
      "trackingNumber" : getNextTrackingNumber(), //TODO: generate tracking num
      "dateRequested" : DateTime.now().millisecondsSinceEpoch,
      "datePickedUp" : DateTime.now().millisecondsSinceEpoch,
      "weight" : this.weight,
      "volume" : this.volume,
      "itemType" : this.itemType,
      "rateForDelivery" : 1.99, //TODO: calculate based on weight/vol
      "deliveryPerson" : "henry",
      "sourceAddy" : this.sourceAddress,
      "deliveryAddr" : this.deliveryAddress
    });
  }
}
