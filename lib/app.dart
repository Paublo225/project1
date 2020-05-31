import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'settime.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'trigger.dart';



class PlatformChannel extends StatefulWidget {
  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}
class _PlatformChannelState extends State<PlatformChannel> {
 

/*static const MethodChannel triggerChannel =
      MethodChannel('com.channel.app/home');
static const MethodCall triggerCall = MethodCall('com.channel.app/home');



  List<dynamic> _getTrigger = ["Ошибка"];*/
/*
Future<List<dynamic>> _createTrigger() async {
    List<dynamic> _getTriggerlist;
    try {
     _getTriggerlist =await triggerChannel.invokeMethod('createTrigger');
    } on PlatformException {
      _getTriggerlist= ['Failed to get action trigger .'];
    }
    setState(() {
      _getTrigger = _getTriggerlist;
    });
    print(_getTrigger);
    return _getTrigger;
  }
initState() {
  super.initState();
  _createTrigger();
  
}
*/
 
  @override
  Widget build(BuildContext context) {
   return CupertinoPageScaffold(
     backgroundColor:Color(0xFF2B2B2B),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black54,
        middle: const Text('HomeAlarm', style: TextStyle(color: Colors.white)),
        leading: Row(children: <Widget>[
          GestureDetector(
            onTap: () => { },
           child: Icon(CupertinoIcons.pen, color: Colors.orange, size: 20),
          ),
          
        ]), 
      
        trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
            GestureDetector(
              onTap: () => {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => AddAlarm()))
                },
              child: Icon(CupertinoIcons.add, color: Colors.orange,size: 35),
            ),
                    
          ]),
        ),
    child: Container(
      color: Color(0xFF2B2B2B), 
      /*child:  new ListView.builder(
        itemCount: triggerList.length,
            itemBuilder: (BuildContext context, int index) =>
                   buildTriggerCard(context,index),
          ),*/
          )
          
          );

}
        
  /* Widget buildTriggerCard(BuildContext context, int index) {


   }        */     
                  
}

