import 'package:flutter/material.dart';
import 'package:world_clock/pages/choose_location.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/loading.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/":(context)=> Loading(),
      "/location" : (context) => ChooseLocation(),
      "/home": (context)=> Home(),
    },
  ));
}
