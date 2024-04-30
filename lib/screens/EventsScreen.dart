import 'package:flutter/material.dart';
import 'package:party_pokhara/models/EventModel.dart';
import 'package:intl/intl.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  List<EventModel> featureEvents = [];
  List<EventModel> todayEvents = [];
  List<EventModel> tomorrowEvents = [];

  @override
  void initState() {
    super.initState();
    _loadAllEventsInList();
  }

  _loadAllEventsInList(){
    featureEvents.add(EventModel("1", "New Party 1", 1615288170930, 1615290170930, "", "oft ware enginasdf eeriasdf ng standards for t", "", "", "resources/images/event_1.jpg", "", "", "Pokhara Lakeside, Pame 2410", true));
    featureEvents.add(EventModel("2", "Pokhara Party 2", 1615288170930, 1615290170930, "", "oftaa sdfsdf asdf ware engasdfineering standards for t", "", "", "resources/images/event_2.jpg", "", "", "Pokhara Lakeside, 2210", true));
    featureEvents.add(EventModel("3", "Lakeside Party", 1615288170930, 1615290170930, "", "oftwf asdf are engineering standards for t", "", "", "resources/images/event_3.jpg", "", "", "Pokhara, Mahendra Pool 2452", true));
    featureEvents.add(EventModel("4", "Hallan Chowk Party", 1615288170930, 1615290170930, "oftasdfasdware engineering standards for t", "", "", "", "resources/images/event_4.jpg", "", "", "Pokhara Chiple Dhunga 2587", true));

    todayEvents.add(EventModel("1", "New Party 1", 1615288170930, 1615290170930, "", "oft ware enginasdf eeriasdf ng standards for t", "", "", "resources/images/event_1.jpg", "", "", "Pokhara Lakeside, Pame 2410", true));
    todayEvents.add(EventModel("2", "Pokhara Party 2", 1615288170930, 1615290170930, "", "oftaa sdfsdf asdf ware engasdfineering standards for t", "", "", "resources/images/event_2.jpg", "", "", "Pokhara Lakeside, 2210", true));
    todayEvents.add(EventModel("3", "Lakeside Party", 1615288170930, 1615290170930, "", "oftwf asdf are engineering standards for t", "", "", "resources/images/event_3.jpg", "", "", "Pokhara, Mahendra Pool 2452", true));
    todayEvents.add(EventModel("4", "Hallan Chowk Party", 1615288170930, 1615290170930, "oftasdfasdware engineering standards for t", "", "", "", "resources/images/event_4.jpg", "", "", "Pokhara Chiple Dhunga 2587", true));

    tomorrowEvents.add(EventModel("1", "New Party 1", 1615288170930, 1615290170930, "", "oft ware enginasdf eeriasdf ng standards for t", "", "", "resources/images/event_1.jpg", "", "", "Pokhara Lakeside, Pame 2410", true));
    tomorrowEvents.add(EventModel("2", "Pokhara Party 2", 1615288170930, 1615290170930, "", "oftaa sdfsdf asdf ware engasdfineering standards for t", "", "", "resources/images/event_2.jpg", "", "", "Pokhara Lakeside, 2210", true));
    tomorrowEvents.add(EventModel("3", "Lakeside Party", 1615288170930, 1615290170930, "", "oftwf asdf are engineering standards for t", "", "", "resources/images/event_3.jpg", "", "", "Pokhara, Mahendra Pool 2452", true));
    tomorrowEvents.add(EventModel("4", "Hallan Chowk Party", 1615288170930, 1615290170930, "oftasdfasdware engineering standards for t", "", "", "", "resources/images/event_4.jpg", "", "", "Pokhara Chiple Dhunga 2587", true));
  }

  Widget _getPartyInfoCard(EventModel eventModel){
    //return Text("X123");
    var startDate = DateFormat.yMEd().add_jms().format(DateTime.fromMicrosecondsSinceEpoch(eventModel.start));
    String subTitle = "Start At: " + startDate + "\nAddress: " + eventModel.address;
    return Card(
      child: ListTile(
        onTap: (){ Navigator.pushNamed(context, "/event_detail", arguments: eventModel); },
        contentPadding: EdgeInsets.all(10),
        leading: Image(image:AssetImage(eventModel.imageLocation)),
        title: Text(eventModel.title, style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 15)),
        subtitle: Text(subTitle, style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, height: double.infinity,
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.black,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Text("Feature Events", style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 15, color: Colors.white)),
          ),
          Column( children: featureEvents.map((e) => _getPartyInfoCard(e)).toList()),
          Container(
            color: Colors.black,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Text("Today Events", style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 15, color: Colors.white)),
          ),
          Column( children: todayEvents.map((e) => _getPartyInfoCard(e)).toList()),
          Container(
            color: Colors.black,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Text("Tomorrow Events", style: TextStyle(fontFamily: 'Raleway', letterSpacing: 1.0, fontSize: 15, color: Colors.white)),
          ),
          Column( children: tomorrowEvents.map((e) => _getPartyInfoCard(e)).toList()),
        ],
      )
    );
  }
}
