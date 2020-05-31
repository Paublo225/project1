import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'app.dart';
import 'style.dart';
import 'package:flutter/services.dart';
import 'scenelist.dart';


class AddAlarm extends StatefulWidget {
  AddAlarm({Key key}) : super(key:key);
@override
_AddAlarmState createState() => _AddAlarmState();


}

class _AddAlarmState extends State<AddAlarm>{

/*  static const MethodChannel triggerChannel =
      MethodChannel('com.channel.app/home');*/

String name;
 DateTime dateTime = DateTime.now();

/* 
List<dynamic> _getTrigger = ["Ошибка"];

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
       navigationBar: CupertinoNavigationBar(
         backgroundColor: Colors.black54,
         middle: const Text('Добавление'),
         leading: Row(children: <Widget>[
           GestureDetector(
             onTap: () => { Navigator.pop(context) },
            child: Text("Отменить", style: TextStyle(color: Colors.orange, fontSize: 18)),
           )
         ]),
         trailing:Row(
           mainAxisSize: MainAxisSize.min,
           children: <Widget>[
           GestureDetector(
             onTap: () => { Navigator.pop(context) },
            child: Text("Сохранить", style: TextStyle(color: Colors.orange, fontSize: 18)),
           )
         ]),
       ),
       
         child: Scaffold(
           backgroundColor: Color(0xFF2B2B2B),
          body: CustomScrollView(
  shrinkWrap: true,
  slivers: <Widget>[
    SliverPadding(
      padding: const EdgeInsets.all( 1.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            Column(children: 
          <Widget>[
            SizedBox(
              height:350,
              child: CupertinoDatePicker(
                backgroundColor: Color(0xFF2B2B2B),
                initialDateTime: dateTime,
                mode:CupertinoDatePickerMode.time,
                onDateTimeChanged: (_dateTime) {
                  
                  setState(() {
                    dateTime = _dateTime;
 
                  }
                  
                  );
 
                }
              )
            ),
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              
              SizedBox(width: 12),
              Text(
                'Время',
                style: TextStyle(fontSize: 18, color: Color(0xFFDACECE)),
              ),
            ],
          ),
          Text(
            DateFormat.jm().format(dateTime),
            style: Styles.deliveryTime,
          ),
        ],
      ),
          Padding(
               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
               child: _buildNameField(),
             ),
              Padding(
               padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 7),
              child: _daysOfWeek(),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 7),
               child: RaisedButton(
                 textColor: Colors.black,
                 color: Colors.orange,
                 padding:const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => SceneList()));
            },
            child: Text("Список сценариев",style: TextStyle(fontSize: 14,)),

               ),
             ),
            
          ],),
          
 
 
         ])
 
   )
    )],)));
  }
 
   Widget _buildNameField() {
     
     return CupertinoTextField(
       style: TextStyle(fontSize: 18, color: Color(0xFFDACECE)),
       padding: const EdgeInsets.symmetric( vertical: 12),
       clearButtonMode: OverlayVisibilityMode.editing,
       textCapitalization: TextCapitalization.words,
       autocorrect: false,
       decoration: const BoxDecoration(
         border: Border(
           top:BorderSide(
             width: 0,
             color: CupertinoColors.white,
           ),
           bottom: BorderSide(
             width: 0,
             color: CupertinoColors.white,
           ),
         ),
       ),
       placeholder: 'Название',
       placeholderStyle: TextStyle(color: Color(0xFFDACECE),fontSize: 18),
       onChanged: (newName) {
         setState(() {
           name = newName;
         });
       },
     );
   }


 Widget _daysOfWeek() {
 return  Material(
     color: Color(0xFF2B2B2B),
     child: Container(
    
       child: Row(
           children: <Widget> [ 
            
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 12),
             ),
              Padding(
               child: new CircleButton(onTap: () => {
                new BoxDecoration(color: Colors.grey),
                 print("Mon")}, text: "Пн"),
               padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 5),
             ),
            Padding(
               child: new CircleButton(onTap: () => print("Tue"), text: "Вт"),
               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
             ),
             Padding(
               child: new CircleButton(onTap: () => print("Wed"), text:"Ср"),
               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
             ),
             Padding(
               child: new CircleButton(onTap: () => print("Thu"), text: "Чт"),
               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
             ),
             Padding(
               child: new CircleButton(onTap: () => print("Fri"), text: "Пт"),
               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
             ),
             Padding(
               child: new CircleButton(onTap: () => print("Sat"), text: "Сб"),
               padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
             ),
             Padding(
               child: new CircleButton(onTap: () => print("Sun"), text: "Вс"),
               padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 5),
             )
           ]),



     )  
     );
   }

   Widget _scenesList() {
     return CupertinoTabView(
              defaultTitle: "DefaultTitle",
              builder: (context) => SceneList(),
            );
   }
 
}
 
   

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;

  const CircleButton({Key key, this.onTap, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 39.0;
    double height = 37.0;

    return new InkResponse(
 highlightColor: Colors.red,
      onTap: onTap,
      child: new Container(
        width: width,
        height: height,
        decoration: new BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        child: Center(
        child: new Text(
          text,
          style: TextStyle(fontSize: 20,color:Colors.white),
        ),
      ),),
      
    );
  }
}

