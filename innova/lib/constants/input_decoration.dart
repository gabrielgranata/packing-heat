import 'package:flutter/material.dart';

class InputDecorationWrapper {

  InputDecorationWrapper({this.hint});

  String hint;

  InputDecoration getInputDecoration(){
    return (InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlue[50], width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.lightBlue[900], width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
    ));
  }
}
