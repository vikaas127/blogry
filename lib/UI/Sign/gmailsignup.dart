import 'package:blogry/app/ApiData.dart';
import 'package:blogry/app/appdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../main.dart';
import 'EmailVerify.dart';

// ignore: camel_case_types
class gmailsignup extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return gmailsignupState();
  }

}
// ignore: camel_case_types
class gmailsignupState extends State<gmailsignup>{
  ProgressDialog  pr;
  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String validatpassword(String value) {
    if (value.length == 0) {
      return 'Enter Password';
    }
    return null;
  }
  TextEditingController textEmail = TextEditingController();
  TextEditingController tetUserName = TextEditingController();



  void navigationPage() {
    //  Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }

  @override
  Widget build(BuildContext context) {

   pr = ProgressDialog(context,type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);
   pr.style(

       message: 'Loading...',
       borderRadius: 8.0,
       backgroundColor: Colors.grey,
       progressWidget: CircularProgressIndicator(backgroundColor: Colors.orange,),
       elevation: 10.0,
       insetAnimCurve: Curves.easeInOut,
       progress: 0.0,
       maxProgress: 100.0,
       progressTextStyle: TextStyle(
           color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
       messageTextStyle: TextStyle(
           color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.w600)
   );
 // ignore: non_constant_identifier_names
 double Height= AppTheme.fullHeight(context);
    return Scaffold(

      backgroundColor: Colors.white,
      body:Container(
          height: AppTheme.fullHeight(context),
          child:Form(autovalidateMode: AutovalidateMode.always,
    key:_formKey,child: ListView(
               //  crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: Height * 0.06,
              ),
              Expanded(
                child: Center(
                  child: Container(height: 80,
                    width: 80,
                    decoration: BoxDecoration(

                        image: DecorationImage(
                          image: AssetImage('assets/logo.jpeg'),

                        )
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Height * 0.00,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child: Text(" Sign up ",style: GoogleFonts.aBeeZee(fontSize: 30,fontWeight: FontWeight.bold),)),
                ),
              ),
              SizedBox(
                height: Height * 0.02
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

                          Container(
                            height: 50,

                            child:




                                    new TextFormField(

                                      controller: tetUserName,
 // ignore: missing_return
 validator: (value){
              if(value==null){
            return   "Enter Name" ;}
},
                                      keyboardType: TextInputType.name,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        hintText: 'Name',
                                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                        border:
                                        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                                      ),


                                  ),



                          ),
                      SizedBox(height: 20,),
                      Container(
                        //height: 50,

                        child:




                        new TextFormField(
                          controller:textEmail ,

                          // ignore: missing_return
                          validator: (String value) {
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regex = new RegExp(pattern);
                           if(!regex.hasMatch(value)){
  return "Please Enter Valid Email";
}else if (value==null){
  return "Please Enter Email";
}

                          },
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          decoration: InputDecoration(

                            errorStyle:TextStyle(
                            fontSize: 16.0,
                          ),
                            hintText: 'Email/Phone',
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            border:
                            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                          ),


                        ),



                      ),

                     SizedBox(height: 50,),
                      InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric( horizontal: 50.0),
                            child: Container(

                              height: 50,
                              decoration: BoxDecoration(
                                  border:  Border.all(width: 1,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(colors: [
                                    Colors.amber,
                                    Colors.deepOrangeAccent
                                  ])),
                              child: Center(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [


                                    SizedBox(width: 80,),
                                    Text(
                                      "Join blogry",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {

                            // Fetch Logged in user Id
                            // int id = await fetchLoggedInUserId();
                            if (_formKey.currentState.validate()) {

                              await pr.show();
    Future.delayed(const Duration(milliseconds: 2000), () {

// Here you can write your code

    setState(() {
    // Here you can write your code for open new view

                              pr.hide().whenComplete(() =>


                            ApiClient().userSignUp(tetUserName.text,textEmail.text,0).then((value) {
                              setState(() {
                              // ignore: non_constant_identifier_names
                              var Response= value.data;
                              print(Response);

                        if(value.statusCode==200) {
                         Fluttertoast.showToast(
      msg: "Registered Succesfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
  );
                                  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (BuildContext context) =>
            EmailVerify(Email: textEmail.text,)),
  );
                                                  }
                        else{
                          Fluttertoast.showToast(
                              msg: "AllReady Registred Account",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }


                            });}));});

    });


                          }}

                      ),
                      SizedBox(height: 40,),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                          SizedBox(width: 10,),
                                          Text(
                                            "Google",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                               // onTap: _handleSignIn

                              // Fetch Logged in user Id
                              // int id = await fetchLoggedInUserId();


                              /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              MyHomePage()),
                                    );*/


                            ),
                          ),
                         
                          Expanded(
                            child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 150,
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
                                          SizedBox(width: 10,),
                                          Text(
                                            "facebook",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                onTap:(){
                                  // Fetch Logged in user Id
                                  // int id = await fetchLoggedInUserId();


                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyHomePage()),
                                  );

                                }

                            ),
                          ),


                        ],
                      )

                    ],
                  ),
                ),
              ),
              Container(color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:40.0),
                    child: Center(
                      child: Text(
                        "By joining our family ,you agree"
                            " to our "
                            "\n"
                            "TERMS AND CONDITIONS & PRIVACY POLICY",

                        style: GoogleFonts.aBeeZee(fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                height: 130,),
            ],
          )),

    ));
  }
}




