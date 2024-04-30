import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  List<String> _tags = [];
  String _uploadFilePath = "";
  DateTime _startDate, _endDate;
  TextEditingController _partyTitleEditingController = TextEditingController(),  _startDateEditingController = TextEditingController(),
      _endDateEditingController = TextEditingController(), _locationEditingController = TextEditingController(),
      _entryFeeEditingController = TextEditingController(), _descriptionEditingController = TextEditingController();

  void _createEvent(){
    print("CREATE EVENT");
  }

  void _setImage(){
    print("SET IMAGE");
  }

  void _setLocation(){
    print("Set location");
  }

  void _openStartDate(){
    DatePicker.showDateTimePicker(context, showTitleActions: true, onConfirm: (date){
      setState(() { _startDate = date; _startDateEditingController.text = DateFormat.yMEd().add_jms().format(_startDate); });
    });
  }

  void _openEndDate(){
    DatePicker.showDateTimePicker(context, showTitleActions: true, onConfirm: (date){
      setState(() { _endDate = date; _endDateEditingController.text = DateFormat.yMEd().add_jms().format(_endDate); });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Create Event",style: TextStyle(fontFamily: 'Raleway', fontWeight: FontWeight.bold)),
          actions: <Widget>[ IconButton(icon: Icon(Icons.save), onPressed: (){ _createEvent(); }) ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            InkWell(
              onTap: (){ _setImage(); },
              child: Image(image: AssetImage("resources/images/upload_poster.png"), height: 250, fit: BoxFit.fitHeight,)
            ),
            Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                child: TextFormField( controller: _partyTitleEditingController, maxLength:255, decoration: InputDecoration( labelText: 'Enter Party Title' ))),
            InkWell(
                onTap: (){ _setLocation(); },
                child: Container( margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0), child: TextFormField( controller: _locationEditingController, readOnly: true, decoration: InputDecoration( labelText: 'Location' ))),
            ),
            InkWell(
              onTap: (){ _openStartDate(); },
              child: Container( margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0), child: TextFormField( controller: _startDateEditingController, autofocus: false, enabled: false, readOnly: true, decoration: InputDecoration( labelText: 'Starts from' ))),
            ),
            InkWell(
              onTap: (){ _openEndDate(); },
              child: Container( margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0), child: TextFormField( controller: _endDateEditingController, autofocus: false, enabled: false, readOnly: true, decoration: InputDecoration( labelText: 'Ends at' ))),
            ),
            Container( margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                child:
                  Tags(
                      textField: TagsTextField(
                        autofocus: false,
                        textStyle: TextStyle(fontSize: 15),
                        width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 5),
                        onSubmitted: (String str) {
                          setState(() { _tags.add(str); });
                        },
                      ),
                      itemCount: _tags.length,
                      itemBuilder: (int index){
                        return ItemTags(
                            key: Key(index.toString()),
                            index: index,
                            title: _tags[index],
                            activeColor: Colors.black,
                            removeButton: ItemTagsRemoveButton( onRemoved: (){ setState(() { _tags.removeAt(index); }); return true; }),
                        );
                      }
                  )
            ),
            Container( margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0), child: TextFormField( controller: _entryFeeEditingController, maxLength:255, decoration: InputDecoration( labelText: 'Enter Fee (Rs.)', hintText: "Enter fee or leave it blank for get entry fee.", hintStyle: TextStyle(color: Colors.white24) ))),
            Container( margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0), child: TextFormField( controller: _descriptionEditingController, maxLines: 4, maxLength: 1000, decoration: InputDecoration( labelText: 'Enter Description', hintText: "Enter party description.", hintStyle: TextStyle(color: Colors.white24) ))),
          ],
        )
      ),
    );
  }
}
