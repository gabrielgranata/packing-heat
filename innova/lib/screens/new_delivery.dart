import 'dart:ffi';

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

  final Firestore db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text.rich(
                  TextSpan(
                    text: 'Request a new delivery',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecorationWrapper(hint: 'Item type').getInputDecoration(),
                  onChanged: (value) {
                    itemType = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecorationWrapper(hint: 'Weight').getInputDecoration(),
                  onChanged: (value) {
                    weight = double.parse(value);
                    print(weight is double);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecorationWrapper(hint: 'Volume').getInputDecoration(),
                  onChanged: (value) {
                    volume = double.parse(value);
                    print(volume is double);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecorationWrapper(hint: 'Source address').getInputDecoration(),
                  onChanged: (value) {
                    sourceAddress = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecorationWrapper(hint: 'Delivery address').getInputDecoration(),
                  onChanged: (value) {
                    deliveryAddress = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: PillButton(
                  title: 'Create request',
                  colour: Colors.deepOrange[200],
                  onPressed: () async {

                    var data = {
                      'status': 'new',
                      'weight': this.weight,
                      'volume': this.volume,
                      'itemType': this.itemType,
                      'rateForDelivery': 1.99,
                      'deliveryPerson': null,
                      'sourceAddress': this.sourceAddress,
                      'deliveryAddress': this.deliveryAddress
                    };

                    var newItem = db.collection('items').document().setData(data);
//                  Navigator.pop(context, newItem);
                    Navigator.pushNamed(context, 'company_home_screen');


                  }
                ),
              )
            ]
          )
        )
      )
    );
  }
}
