
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'style.dart';
import 'app.dart';
import 'settime.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        

      
      textTheme: CupertinoTextThemeData(
textStyle: TextStyle(color: Colors.black)
      )
      ),
      home: PlatformChannel()
       
      );
    
  }
}
class CupertinoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
middle: const Text("Alarm"),
      ),
      child: Container(),
    );
  }
}



  
