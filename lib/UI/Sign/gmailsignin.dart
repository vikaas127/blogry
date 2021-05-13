
import 'package:blogry/app/ApiData.dart';
import 'package:blogry/app/appdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'EmailVerify.dart';

// ignore: camel_case_types
class gmailsignin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return gmailsigninState();
  }

}
// ignore: camel_case_types
class gmailsigninState extends State<gmailsignin>{



  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  TextEditingController textphn = TextEditingController();
  TextEditingController tetEmail = TextEditingController();



  void navigationPage() {
    //  Navigator.of(context).pushReplacementNamed(HOME_SCREEN);
  }
ProgressDialog pr;
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
      body:
      Container(
          height: AppTheme.fullHeight(context),
          child: Form(autovalidateMode: AutovalidateMode.always,
              key:_formKey,child:  ListView(

            shrinkWrap: true,
          //  crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: Height * 0.08,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left :0.0),
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
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text("Sign in with email",style: GoogleFonts.aBeeZee(fontSize: 30,fontWeight: FontWeight.bold),),
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


                        child:




                        new TextFormField(
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

                          controller: tetEmail,
                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          decoration:InputDecoration(
                        border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            color: Colors.blue.shade300),
                      ),
                    prefixIcon: IconButton(
                        icon: Icon(Icons.email,
                            color: Colors.orange), onPressed: () {  },),
                    hintText:  "Email",
                    hintStyle: TextStyle(
                        color: Colors.grey[400])),
              ),







                      ),

                      SizedBox(height: 60,),
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


                                    SizedBox(width: 90,),
                                    Center(
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
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
                                      ApiClient().userSignin(tetEmail.text,0).then((
                                          value) {
                                        print(value.data);

                                        setState(() {
                                          if(value.statusCode==200) {
                                            Fluttertoast.showToast(
                                                msg: "OTP Sent",
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
                                                      EmailVerify(Email: tetEmail.text)),
                                            );
                                        }     else if (value.statusCode==502){
    Fluttertoast.showToast(
    msg: " Registre First ",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0
    );
    }
                                          });
                                      }));






                                  });

                              });







                            }
                          }
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: AppTheme.fullHeight(context)*0.10,),
              Container(color: Colors.white,
                child:  Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:40.0),
                    child: Center(
                      child: Text(
                        "By sign up ,you agree"

                            " to our "
                            "\n"
                            "Termsof"

                            "Service and acknowledge that "
                            "\n"
                            "our Privacy Police applies to you",
                        style: GoogleFonts.aBeeZee(fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                height: 150,),
            ],
          )),

    ),);
  }
}




