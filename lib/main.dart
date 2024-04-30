import 'package:flutter/material.dart';
import 'package:party_pokhara/screens/AboutScreen.dart';
import 'package:party_pokhara/screens/CreateEventScreen.dart';
import 'package:party_pokhara/screens/EventDetailScreen.dart';
import 'package:party_pokhara/screens/HomeScreen.dart';
import 'package:party_pokhara/screens/LocationMapDetailScreen.dart';
import 'package:party_pokhara/screens/SplashScreen.dart';
import 'package:party_pokhara/screens/MenuScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        accentColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home' : (context) => HomeScreen(),
        '/menu_screen' : (context) => MenuScreen(),
        '/create_event': (context) => CreateEventScreen(),
        '/event_detail': (context) => EventDetailScreen(),
        '/about': (context) => AboutScreen(),
        '/location_detail': (context) => LocationMapDetailScreen(),
      }
    );
  }
}