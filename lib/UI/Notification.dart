import 'package:blogry/app/appdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return NotificationState();
  }

}
class NotificationState extends State<Notification>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.blue,
        height: AppTheme.fullHeight(context),),
    );
  }

}
