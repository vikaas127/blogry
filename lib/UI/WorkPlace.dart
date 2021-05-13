import 'package:blogry/app/appdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkPlace extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return WorkPlaceState();
  }

}
class WorkPlaceState extends State<WorkPlace>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.amberAccent,
        height: AppTheme.fullHeight(context),),
    );
  }

}
