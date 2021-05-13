import 'package:blogry/UI/Blog/Blogget.dart';
import 'package:blogry/model/Blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBlogget extends StatefulWidget {
 final List blogid;
const MyBlogget({
Key key, @required this.blogid,}) : super(key: key);

@override
State<StatefulWidget> createState() {
  return MyBloggetState();
}
}
class MyBloggetState extends State<MyBlogget>{
  Blog blog;

  @override
  Widget build(BuildContext context) {
  return Scaffold( body: ListView.builder(itemCount: widget.blogid.length,
      itemBuilder: (context,index){
    return ListTile(title: Text(widget.blogid[index]),
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                Blogget(blogid: widget.blogid[index],),
      ));
    },);
  }),
    appBar: AppBar(title:Text("MyBlogs",style: GoogleFonts.aBeeZee(fontSize: 18),) ,actions: [

  ],) ,);
  }}