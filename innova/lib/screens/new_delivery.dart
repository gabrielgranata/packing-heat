import 'package:flutter/material.dart';
import 'package:innova/constants/input_decoration.dart';
import 'package:innova/widgets/pill_button.dart';
import 'package:http/http.dart' as http;

class NewDeliveryForm extends StatelessWidget {
  String status;
  String trackingNumber;
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
                decoration: InputDecorationWrapper(hint: 'Delivery person').getInputDecoration(),
                onChanged: (value) {
                  deliveryPerson = value;
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
                  Navigator.pushNamed(context, 'company_home_screen');
                    var url = 'http://uottahack2020.herokuapp.com/items';
                    var response = await http.post(
                      url,
                      body: {
                        status: "new",
                        trackingNumber: "12345abc", //TODO: generate tracking num
                        dateRequested: DateTime.now(),
                        datePickedUp: null,
                        rateForDelivery: 1.99, //TODO: calculate based on weight/vol
                        weight: this.weight,
                        volume: this.volume,
                        itemType: this.itemType,
                        deliveryPerson: "",
                        sourceAddress: this.sourceAddress,
                        deliveryAddress: this.deliveryAddress
                      }
                    );
                    print(response.statusCode);
                }
              )
            ]
          )
        )
      )
    );
  }
}
