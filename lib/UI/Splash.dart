import 'dart:async';

import 'package:blogry/UI/Sign/login.dart';
import 'package:blogry/app/appConstant.dart';
import 'package:blogry/app/appperferance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Splash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Splashstate();
  }

}
class Splashstate extends State<Splash>{
  //ProgressDialog pr;

  var _visible = true;
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  getProducts() async{

    // cartproductscat= await wooCommerce.getProductCategories();

    setState(() {

    });

  }
  Future<void> navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;

    Future.delayed(Duration(seconds: 2))
        .then((value) {

      AppPreferences.getBool(AppConstants.Auth_Token).then((value) {setState(() {
        if (value == true){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    MyHomePage()
            ),
          );
        }else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  Login(),
            ),
          );
        }
      });


    });});}










  @override
  Future<void> initState()   {
    super.initState();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
   // pr = new ProgressDialog(context, showLogs: true);
  //  pr.style(message: 'Loading...');
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(children: [Center(
                    child: Container(
                      decoration: BoxDecoration(

                          image: DecorationImage(
                            image: AssetImage('assets/logo.jpeg'),

                          )
                      ),
                    )  )],),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height ,

                decoration: BoxDecoration(
                  color: Colors.white,

                ),

              ),

            ],
          ),
        ],
      ),
    );

}


}