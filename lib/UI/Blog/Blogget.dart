import 'package:blogry/app/ApiData.dart';
import 'package:blogry/app/appConstant.dart';
import 'package:blogry/app/appperferance.dart';
import 'package:blogry/model/Blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Blogupdate.dart';

class Blogget extends StatefulWidget {
  final blogid;
  const Blogget({
    Key key, @required this.blogid,}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
   return BloggetState();
  }
}
class BloggetState extends State<Blogget>{
  Blog blog;
  String html = '<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!';
@override
  void initState() {
  print(widget.blogid);
  AppPreferences.getString(AppConstants.Token).then((valuetoken) =>

      ApiClient().getblog(valuetoken,widget.blogid).then((value) {

setState(() {
  blog=  Blog.fromJson(value.data);
  print(blog.sId);
});
      }
      ));

  ;
  super.initState();
}
  @override
  Widget build(BuildContext context) {
 return Scaffold(
   appBar: AppBar(title:Text("Blog Details",style: GoogleFonts.aBeeZee(fontSize: 18),) ,actions: [
   IconButton(icon: Icon(Icons.edit), onPressed: (){
     Navigator.push(
     context,
     MaterialPageRoute(
         builder: (BuildContext context) =>
             Blogupdate()),);

   })
 ],),
   body:blog!=null?new Container(child: ListView(scrollDirection: Axis.vertical,shrinkWrap: true,
     children: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Center(child: Text(blog.title,style: GoogleFonts.aBeeZee(fontSize: 25,fontWeight: FontWeight.bold),)),
       ),
       Html(data: blog.content,),
     ],
   )):Center(child: CircularProgressIndicator()),



    );





  }

  }
