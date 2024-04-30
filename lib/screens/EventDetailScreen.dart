import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:party_pokhara/models/EventModel.dart';
import 'package:intl/intl.dart';
import 'package:flutter_tags/flutter_tags.dart';

class EventDetailScreen extends StatefulWidget {
  @override
  _EventDetailScreenState createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    eventModel = ModalRoute.of(context).settings.arguments;

    String address = eventModel.address;
    String km = "1756 km";
    String starts = DateFormat.yMEd().add_jms().format(DateTime.fromMicrosecondsSinceEpoch(eventModel.start));
    String ends = DateFormat.yMEd().add_jms().format(DateTime.fromMicrosecondsSinceEpoch(eventModel.end));
    String entryFee = (eventModel.fee == "")? "Check at entry gate": eventModel.fee;
    List<String> tags = eventModel.tags.split(",");

    return Scaffold(
      appBar: AppBar(title: Text(eventModel.title, style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold))),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity, height: 300,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image(image: AssetImage(eventModel.imageLocation), fit:BoxFit.cover),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                        alignment: Alignment.center,
                        child: Image(image: AssetImage(eventModel.imageLocation), fit:BoxFit.fitHeight),
                      ),
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, '/location_detail', arguments: { "address" : 'Nepal, Pokahra 20141', 'lat': 1252.2521, 'long':125475.585454 });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Align(alignment: Alignment.centerLeft, child: Icon(Icons.location_on_rounded))),
                    Expanded(child: Column(
                      children: <Widget>[
                        Align(alignment: Alignment.centerRight, child: Text(address, style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal, color: Colors.white))),
                        Align(alignment: Alignment.centerRight, child: Text(km, style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal, color: Colors.white))),
                      ],
                    ))
                  ],
                ),
              )
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded( child: Text("Start", style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal, color: Colors.white54))),
                  Align(alignment: Alignment.centerRight, child: Text(starts, style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal, color: Colors.white)))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded( child: Text("End", style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal, color: Colors.white54))),
                  Align(alignment: Alignment.centerRight, child: Text(ends, style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal, color: Colors.white)))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded( child: Text("Entry Fee", style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal, color: Colors.white54))),
                  Align(alignment: Alignment.centerRight, child: Text(entryFee, style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal, color: Colors.white)))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 20),
              child: Text("Description", style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal, color: Colors.white), textAlign: TextAlign.justify),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(eventModel.description, style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.normal, color: Colors.white), textAlign: TextAlign.justify),
            ),
            Container(width: double.infinity, height: 10),
            Divider(height: 1, color: Colors.white38, indent: 20, endIndent: 20),
            Container(width: double.infinity, height: 15),
            Tags(
              itemCount: tags.length,
              itemBuilder: (int index){
                return ItemTags( key: Key(index.toString()), index: index, title: tags[index], activeColor: Colors.black);
              }
            ),
            Container(width: double.infinity, height: 40)
          ],
        ),
      ),
    );
  }
}
