import 'package:basicapp/home.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Form Handling',
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: const Home(),
  ));
}

