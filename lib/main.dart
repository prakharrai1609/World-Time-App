import 'package:flutter/material.dart';
import 'package:world_time_app/Pages/home.dart';
import 'package:world_time_app/Pages/loading.dart';
import 'package:world_time_app/Pages/choose_location.dart';
import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location(),
    },
  ));
}
