import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  openCreateEvent(){
    Navigator.pushNamed(context, "/create_event");
  }

  void _openUrl(url) async =>  await canLaunch(url)?await launch(url):throw 'Could not launch $url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity, height: double.infinity,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: Container( padding: EdgeInsets.all(5), margin: EdgeInsets.all(5), width: 100, height:100, child: CircleAvatar(radius: 50, child: Image(image:AssetImage("resources/images/user_image.png"), fit: BoxFit.contain, color: Colors.white)))),
                    Expanded(flex: 3,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("userabc@gmail.com", style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 15, fontWeight: FontWeight.w600)),
                              Text("David Popoiw", style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 13)),
                            ]
                        ))
                  ],
                ),
                Divider(height: 1, color: Colors.grey, indent: 20, endIndent: 20),
                ListTile(
                  onTap: (){openCreateEvent();},
                  title: Text("Create Event", style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 15)),
                  trailing: Icon(Icons.add),
                ),
                Divider(height: 1, color: Colors.grey, indent: 20, endIndent: 20),
                ListTile(
                  onTap: (){ Navigator.pushNamed(context, '/about'); },
                  title: Text("About", style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 15)),
                  trailing: Icon(Icons.info),
                ),
                Divider(height: 1, color: Colors.grey, indent: 20, endIndent: 20),
                ListTile(
                  onTap: (){ _openUrl("https://flutter.dev"); },
                  title: Text("Terms & Conditions", style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 15)),
                  trailing: Icon(Icons.security),
                ),
                Divider(height: 1, color: Colors.grey, indent: 20, endIndent: 20),
                ListTile(
                  onTap: (){ _openUrl("https://flutter.dev"); },
                  title: Text("Privacy & Policy", style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 15)),
                  trailing: Icon(Icons.policy),
                )
              ],
            ),
          ),
        )
    );
  }
}