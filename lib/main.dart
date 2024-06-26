import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsapp_ui/views/HomeView/home_view.dart';
import 'package:whatsapp_ui/views/SplashView/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashView(),
        '/home': (context) => HomeView(),
      },
    );
  }
}


