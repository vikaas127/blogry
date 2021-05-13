import 'dart:convert';

import 'package:blogry/UI/Blog/MyBlogs.dart';
import 'package:blogry/Widgets/EditProfile.dart';
import 'package:blogry/Widgets/edit_popup.dart';
import 'package:blogry/app/ApiData.dart';
import 'package:blogry/app/appConstant.dart';
import 'package:blogry/app/appperferance.dart';
import 'package:blogry/model/Profiledata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }

}
class ProfileState extends State<Profile>{
  Profiledata profile;
  String result = "";
@override
  void initState() {
  AppPreferences.getString(AppConstants.Token).then((value) =>

  ApiClient().userprofile(value).then((value) {
    setState(() {
      Map<String, dynamic> response = value.data;
      profile = Profiledata.fromJson(response);
      print(profile.bio);
    });
  }
  ));

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.all(20),

          child:profile!=null ?ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32.0,20.0,32.0,16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.account_circle, size: 90.0,color: Colors.grey,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(profile.username??"", style: GoogleFonts.aBeeZee(fontSize: 25.0,fontWeight: FontWeight.bold),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(child: Text("Following: 5", style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 18),)),
                            Expanded(child: Text("Followers:12", style: GoogleFonts.aBeeZee(color: Colors.black,fontSize: 18),)),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(profile.email, style: GoogleFonts.aBeeZee(color: Colors.black45),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Column(crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                               Row(
                                 children: [
                                   Expanded(flex: 5,child: Text(profile.bio, style: GoogleFonts.aBeeZee(color: Colors.black45),)),
                                 IconButton(icon: Icon(Icons.edit), onPressed: (){
                                   EditProfile.show(context, onEdit: (){});
                                 })
                                 ],
                               ),
                          ],
                        ),


                        )

                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40.0,16.0,40.0,40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        /*  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Home", style: TextStyle(fontSize: 18.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Audio", style: TextStyle(fontSize: 18.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Bookmarks", style: TextStyle(fontSize: 18.0),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Interests", style: TextStyle(fontSize: 18.0),),
                ),*/
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Become a member", style: GoogleFonts.aBeeZee(fontSize: 18.0, color: Colors.teal),),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListTile(onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      MyBlogget(blogid: profile.blogs)),
                            );
                          },
                              title: Center(child: Text("New Blogs", style: GoogleFonts.aBeeZee(fontSize: 18.0),))),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ListTile(title: Center(child: Text("Saved Blogs", style: GoogleFonts.aBeeZee(fontSize: 18.0),))),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child:ListTile(title: Center(child: Text("Logout", style: GoogleFonts.aBeeZee(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.red),))),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ):Center(child: CircularProgressIndicator()),
        ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}