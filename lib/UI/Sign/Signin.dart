import 'package:blogry/UI/Sign/gmailsignin.dart';
import 'package:blogry/app/appdata.dart';
import 'package:blogry/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SignState();
  }

}
class SignState extends State<Signin>{



  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String validateMobile(String value) {
    if (value.length == 0) {
      return 'Enter user name';
    }
    return null;
  }

  String validatpassword(String value) {
    if (value.length == 0) {
      return 'Enter Password';
    }
    return null;
  }



  TextEditingController textphn = TextEditingController();
  TextEditingController tetpass = TextEditingController();



  void navigationPage() {
    //  Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }

  @override
  Widget build(BuildContext context) {

    // ignore: non_constant_identifier_names
    var Height = MediaQuery.of(context).size.height;

    return Scaffold(


      backgroundColor: Colors.white,
      body:
      Container(
height: AppTheme.fullHeight(context),
          child: ListView(
            shrinkWrap: true,
           // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: Height * 0.08,
              ),
              Center(
                child: Container(height: 80,
                  width: 80,
                  decoration: BoxDecoration(

                      image: DecorationImage(
                        image: AssetImage('assets/logo.jpeg'),

                      )
                  ),
                ),
              ),


              SizedBox(
                height: Height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Center(child: Text("Welcome Back",style: GoogleFonts.aBeeZee(fontSize: 35,fontWeight: FontWeight.bold),)),
              ),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Container(
                 // height: Height * 0.70,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border:  Border.all(width: 1,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Colors.white,
                                Colors.white
                              ])),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left:18.0),
                                  child: Center(child: FaIcon(FontAwesomeIcons.google),),
                                ),
                                SizedBox(width: 70,),
                                Text(
                                  "Sign in with google",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {

                            // Fetch Logged in user Id
                            // int id = await fetchLoggedInUserId();


                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Home()),
                            );

                          }

                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border:  Border.all(width: 1,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Colors.white,
                                Colors.white
                              ])),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left:18.0),
                                  child: Center(child: FaIcon(FontAwesomeIcons.facebook,color: Colors.blueAccent,),),
                                ),
                                SizedBox(width: 80,),
                                Text(
                                  "Sign in with facebook",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            // Fetch Logged in user Id
                            // int id = await fetchLoggedInUserId();


                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Home()),
                            );

                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border:  Border.all(width: 1,
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(colors: [
                                Colors.white,
                                Colors.white
                              ])),
                          child: Center(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left:18.0),
                                  child: Center(child: Icon(Icons.email_outlined,color: Colors.redAccent,)),
                                ),
                                SizedBox(width: 80,),
                                Text(
                                  "Sign in with email",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      gmailsignin()),
                            );

                          }

                      ),
                      SizedBox(
                        height: 48,
                      ),
                      Center(
                        child: Row(
                          children: [
                            SizedBox(width: 60,),
                            Text(
                              "Don't Have Account ?",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Sign UP",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),

    );
  }
}




