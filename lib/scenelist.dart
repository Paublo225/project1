import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'app.dart';
import 'style.dart';
import 'package:flutter/services.dart';

import 'settime.dart';


class SceneList extends StatefulWidget {
@override
_SceneListState createState() => _SceneListState();
}

class _SceneListState extends State<SceneList>{

  static const MethodChannel methodChannel =
      MethodChannel('com.channel.app/actionset');
  static const EventChannel eventChannel =
      EventChannel('com.channel.app/eventus');
static const MethodChannel _methodChannelHome =
      MethodChannel('com.channel.app/home');
   int i;

   

  List<dynamic> _getActionList = ["faild"];
  String _getHome = "Unknown";

  Future<List<dynamic>> _getActionLists() async {
  
     List<dynamic> _getAction;
    
    try {
     _getAction = await _methodChannelHome.invokeMethod('getActions');
    } on PlatformException catch (e){
      _getAction= ['Failed to get action list .'];
    }
    setState(() {
      
      _getActionList = _getAction;
      
    });
    print(_getAction);
    print(_getActionList);
    return _getActionList;
  }



  Future<String> _getHomes() async {
    String getHome;
    try {
  getHome = await _methodChannelHome.invokeMethod('getHome');
    } on PlatformException{
      getHome =  "faild";
      
    }
    setState(() {
      _getHome = getHome;
    });
    return _getHome;
  }
initState() {
  super.initState();
  _getHomes();
  _getActionLists();

}

int _radioValue;
void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
    });
  }
  @override
    Widget build(BuildContext context) {
   return CupertinoPageScaffold(
 
       navigationBar: CupertinoNavigationBar(
       
         backgroundColor: Colors.black45,
         middle: Text('$_getHome'),
         leading: Row(children: <Widget>[
           GestureDetector(
             onTap: () => { Navigator.pop(context)
             },
            child: Icon(CupertinoIcons.back, color: Colors.orange, size: 20),
           )
         ]),
       ),
       child: Scaffold(
           backgroundColor: Color(0xFF2B2B2B),
          body: Container(
            child: new ListView.builder(
              itemCount: 1,
            itemBuilder: (BuildContext context, int index){
           
                   
              return Column (
                 children: <Widget>[
                   
                   for(i=0;i<_getActionList.length;i++) 
                    Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                
                
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                   Container (
                 
                     margin: EdgeInsets.all(15),
                    child: Container(child:Text(_getActionList[i], style: TextStyle(fontSize: 20,color: CupertinoColors.white))),
                 
              )
              ],
              ),
             new InkResponse(
                enableFeedback: false,
             onTap:  _onChanged,
              child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: _colors[_currentIndex],
          shape: BoxShape.circle,
        ),
               
               ),

                    )],)
              ],
              );
                
                 
                
            },
          ),)));

}




double size = 30.0;
List<Color> _colors = [ //Get list of colors
    Colors.white,
    Colors.orange,
  ];

  int _currentIndex = 0;

  _onChanged() { //update with a new color when the user taps button
    int _colorCount = _colors.length;

    setState(() {
      if (_currentIndex == _colorCount - 1) {
        _currentIndex = 0;
      } else {
        _currentIndex += 1;
      }
    });
}}