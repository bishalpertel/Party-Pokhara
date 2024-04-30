import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("About", style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold))),
      body: Text("About info"),
    );
  }
}
