import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:party_pokhara/models/BannerImageModel.dart';
import 'package:party_pokhara/models/EventModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<EventModel> eventModels = [];
  List<BannerImageModel> banners = [];

  void initState(){
    super.initState();
    _loadData();
  }

  Future<void> _loadData(){
    eventModels.add(EventModel("1", "New Party 1", 1615288170930, 1615290170930, "", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas nec mauris suscipit, volutpat est mattis, porttitor eros. Duis blandit urna sit amet ornare lobortis. Morbi iaculis sem at dignissim pellentesque. Integer nunc sem, commodo consequat neque eu, posuere elementum quam. Fusce sit amet facilisis ipsum. Donec consequat magna at metus pellentesque, nec volutpat quam vulputate. Phasellus egestas, lectus sollicitudin commodo ullamcorper, quam est efficitur tellus, id lacinia mi ante id nunc. Sed ac dolor purus.", "Parties, Free, Open Bar, Ladies Night, Night Show, asdfasdf, asdfasdf, adfasfasf, asdfasfda, adfasdf, adsfasfd, sdfgdsgf, trytry, uyi", "", "resources/images/event_1.jpg", "", "", "Pokhara Lakeside, Pame 2410", true));
    eventModels.add(EventModel("2", "Pokhara Party 2", 1615288170930, 1615290170930, "", "oftaa sdfsdf asdf ware engasdfineering standards for t", "", "", "resources/images/event_2.jpg", "", "", "Pokhara Lakeside, 2210", true));
    eventModels.add(EventModel("3", "Lakeside Party", 1615288170930, 1615290170930, "", "oftwf asdf are engineering standards for t", "", "", "resources/images/event_3.jpg", "", "", "Pokhara, Mahendra Pool 2452", true));
    eventModels.add(EventModel("4", "Hallan Chowk Party", 1615288170930, 1615290170930, "oftasdfasdware engineering standards for t", "", "", "", "resources/images/event_4.jpg", "", "", "Pokhara Chiple Dhunga 2587", true));
    eventModels.add(EventModel("5", "Late Night Party", 1615288170930, 1615290170930, "", "oftwas dfasdfare engineering standards for t", "", "", "resources/images/event_2.jpg", "", "", "Pokhara Lakeside, Pame 2410", true));
    eventModels.add(EventModel("6", "Disco Party", 1615288170930, 1615290170930, "", "", "", "", "resources/images/event_3.jpg", "", "", "Pokhara Mahendra Pool, 2210", true));
    eventModels.add(EventModel("7", "Saturday Night Party", 1615288170930, 1615290170930, "", "oftwasdfaare engineering standards for t", "", "", "resources/images/event_4.jpg", "", "", "Pokhara Lakeside, 2410", true));
    eventModels.add(EventModel("8", "Last Friday Party", 1615288170930, 1615290170930, "", "Sa sdf Sasdf Sdfftware engineering standards for t", "", "", "resources/images/event_2.jpg", "", "", "Pokhara Lakeside, 2410", true));
    eventModels.add(EventModel("9", "Raw Teen Party", 1615488170930, 1615590170930, "", "oftasdf asdf ware engineering standards for t", "", "", "resources/images/event_3.jpg", "", "", "Pokhara Mahendra Pool, 2410", true));
    eventModels.add(EventModel("10", "Full Vibrant Party 10", 1616288170930, 1616390170930, "", "oftware engineering standards for t", "", "", "resources/images/event_4.jpg", "", "", "Pokhara Lakeside, Pame 2410", true));

    banners.add(BannerImageModel("resources/images/event_1.jpg", "1"));
    banners.add(BannerImageModel("resources/images/event_2.jpg", "2"));
    banners.add(BannerImageModel("resources/images/event_3.jpg", "3"));
    banners.add(BannerImageModel("resources/images/event_4.jpg", "4"));
    banners.add(BannerImageModel("resources/images/event_2.jpg", "5"));
    banners.add(BannerImageModel("resources/images/event_1.jpg", "6"));
  }

  _getPartyInfoCard(EventModel eventModel){
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

  _getBanner(){
    return Container(
        height: 300,
        width: double.infinity,
        color: Colors.black,
        child:CarouselSlider(
            options: CarouselOptions(
              height: 300,
              aspectRatio: 16/9,
              viewportFraction: 0.8,
              initialPage: 0, enableInfiniteScroll: true, reverse: false, autoPlay: true,
              autoPlayInterval: Duration(seconds: 3), autoPlayAnimationDuration: Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn, scrollDirection: Axis.horizontal,
            ),
            items: _getBannerInfo()
        )
    );
  }

  _getBannerInfo(){
    return banners.map((banner){
      return GestureDetector(
          onTap: () => _onBannerClick(banner),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration( color: Colors.black),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image(image: AssetImage(banner.image), fit:BoxFit.cover),
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.grey.withOpacity(0.1),
                        alignment: Alignment.center,
                        child: Image(image: AssetImage(banner.image), fit:BoxFit.fitHeight),
                      ),
                    ),
                  )
                ],
              ),
          )
      );
    }).toList();
  }

  _onBannerClick(BannerImageModel bannerImageModel){
    //Open Event Page
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity, height: double.infinity,
        child:  ListView.builder(
          itemCount: eventModels.length + 1, //For carousel [0]
          itemBuilder: (BuildContext context, int position){
            if(position == 0) return _getBanner();
            else return _getPartyInfoCard(eventModels[position - 1]);
          }),
    );
  }
}
