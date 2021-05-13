import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';

class Blogupdate extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return BlogUpdateState();
  }

}
class BlogUpdateState  extends State<Blogupdate>{
  @override
  Widget build(BuildContext context) {
   return  Scaffold(body:Container(child: Text("",style: TextStyle(color: Colors.orange),),)

   );
  }

}