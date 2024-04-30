import 'package:flutter/material.dart';
import 'package:party_pokhara/screens/EventsScreen.dart';
import 'package:party_pokhara/screens/ExploreScreen.dart';
import 'package:party_pokhara/screens/MenuScreen.dart';
import 'package:party_pokhara/screens/VenusScreen.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  String currentAppBarTitle = "Explore Events";

  void changeBottomNavigationItem(int index){
    setState(() {
      currentIndex = index;
      if(index == 0){ currentAppBarTitle = "Explore Events"; } else if(index == 1){ currentAppBarTitle = "Events"; } else if(index == 2){ currentAppBarTitle = "Venus"; } else if(index == 3){ currentAppBarTitle = "Menu"; }
    });
  }

  Widget getScreen(int index){
    if(index == 0){ return ExploreScreen(); } else if(index == 1){ return EventScreen();} else if(index == 2){ return VenuScreen();} else if(index == 3){  return MenuScreen();} return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(currentAppBarTitle, style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold))),
      body: Container(
        child: getScreen(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Events"),
          BottomNavigationBarItem(icon: Icon(Icons.room), label: "Venus"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: changeBottomNavigationItem,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}