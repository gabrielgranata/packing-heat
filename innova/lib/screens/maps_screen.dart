import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapsScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  final bool isProduction = false;


  double lat;
  double lng;

  @override
  void initState() {
    // TODO: implement initState
    getLatLong();
    super.initState();
  }
//  @override
//  initState() {
//    super.initState();
//    lat = 37.42796133580664;
//    long = -122.085749655962;
//
//  }
  void getLatLong() async {
    try{
      var response = await http.get(isProduction ? 'http://uottahack2020.herokuapp.com/latlong' : "http://10.0.2.2:3000/latlong");

      setState(() {
        var jsonBody = jsonDecode(response.body);
        lat = jsonBody["lat"];
        lng = jsonBody["lng"];
        print(lat);
        print(lng);
      });
    } catch (e) {
      print(e);
    }

//    double lat = latLongList[0];
//    double long = latLongList[1];

  }

  Future<void> changeLocation(lat, lng) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      bearing: 192.8334901395799,
        target: LatLng(lat, lng),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414),
    ));
  }

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(5, 5),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await changeLocation(lat, lng);
        },
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}