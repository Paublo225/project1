import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
class PlatformChannel extends StatefulWidget {
  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}
class _PlatformChannelState extends State<PlatformChannel> {
  static const MethodChannel methodChannel =
      MethodChannel('com.channel.app/actionset');
  static const EventChannel eventChannel =
      EventChannel('com.channel.app/eventus');

  String _getActionList = "Can't get ActionList";


  Future<void> _getActionLists() async {
    String getActionList;
    try {
     await methodChannel.invokeMethod('getActionList');
    } on PlatformException {
      getActionList= 'Failed to get action list .';
    }
    setState(() {
      _getActionList = getActionList;
    });
  }

 
Future<String> _getOSVersion() async {
    String version;
    try {
      version = await methodChannel.invokeMethod('getOSVersion');
    } on PlatformException catch (e) {
      version = e.message;
    }
    return version;
  }
Future<Map<String, String>> _isCameraAvailable() async {
    Map<String, String> cameraStatus;
    try {
      cameraStatus = await methodChannel.invokeMapMethod('isCameraAvailable');
    } on PlatformException catch (e) {
      cameraStatus = {'status': e.message};
    }
    return cameraStatus;
  }
RaisedButton callNumberButton() {
    return RaisedButton(
      onPressed: () {
        _callNumber('1234');
      },
      child: Text('Call number 1234'),
    );
  }
  _callNumber(String number) async {
    await methodChannel.invokeMapMethod('callNumber', {'number': number});
  }



Builder osVersionButton() {
    return Builder(
      builder: (context) => RaisedButton(
            onPressed: () {
              _getOSVersion().then((value) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(value),
                    duration: Duration(seconds: 3),
                  ),
                );
              });
            },
            child: Text('OS Version'),
          ),
    );
  }


Builder checkCameraButton() {
    return Builder(
      builder: (context) => RaisedButton(
            onPressed: () {
              _isCameraAvailable().then((value) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(value['status']),
                    duration: Duration(seconds: 3),
                  ),
                );
              });
            },
            child: Text('Check Camera Hardware'),
          ),
    );
  }



 @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              osVersionButton(),
            checkCameraButton(),
            callNumberButton(),
              Text(_getActionList, key: const Key('Battery level label')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  child: const Text('Refresh'),
                  onPressed: _getActionLists,
                ),
              ),
              
            ],
          ),
        
        ],
      ),
    );
  }
}






bool isSwitched = false;
class SceneList extends StatefulWidget {
@override
_SceneListState createState() => _SceneListState();
}

class _SceneListState extends State<SceneList>{
  @override
    Widget build(BuildContext context) {
   return MaterialApp(
      title: 'Test App',
      color: Colors.white,
      home: Scaffold(
        appBar: AppBar(
          leading: Row(children: <Widget>[
           GestureDetector(
             onTap: () => { Navigator.pop(context) },
            child: Icon(CupertinoIcons.back, color: Colors.orange, size: 20),
           )
         ]),
          title: Text('Your Alarm Clocks'),
          backgroundColor: Colors.white,
            textTheme: TextTheme (
              title:  TextStyle (
                color:  Colors.black,
                    fontSize: 20,
                fontWeight: FontWeight.bold
              )
            ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                              Text('07:45', style: TextStyle(
                            fontSize:35
                        ),),
                              Text('Welcome', style: TextStyle(
                                  fontSize:15),
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('am', style: TextStyle(
                                fontSize: 15
                              ),),
                            )
//                            Text('am', style: TextStyle(
//                            fontSize:15
//                        ),),
                          ],
                        )
                      ],
                    ),

//                      Text('Weekend'),
                    ],
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged : (value) {
                      isSwitched = value;
                    }
                    ),
            ]
              ),
            )
          ])
            
       
      )
   ); 
}
}
   */