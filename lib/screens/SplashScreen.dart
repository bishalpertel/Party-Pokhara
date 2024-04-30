import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity, height: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('resources/images/splashscreen_background.png'), fit: BoxFit.cover)),
      )
    );
  }
}