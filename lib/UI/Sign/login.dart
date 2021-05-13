import 'package:blogry/UI/Sign/Signin.dart';
import 'package:blogry/app/appdata.dart';
import 'package:blogry/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'gmailsignup.dart';
GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }

}
class LoginState extends State<Login>{
  bool isLoggedIn = false;

  void onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }
 /* void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
    await facebookLogin.logIn(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        onLoginStatusChanged(true);
        break;
    }
  }*/
  @override
  void initState() {
    super.initState();
_googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account){
  setState(() {
  });
});
_googleSignIn.signInSilently();
  }


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
      bottomSheet: Container(color: Colors.white,
        child:    Center(
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
        height: 150,),

        backgroundColor: Colors.white,
        body: Container(
            height: AppTheme.fullHeight(context),
                child: Column(
                 // shrinkWrap: true,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: Height * 0.08,
                    ),
                    Container(height: 80,
                      width: 80,
                      decoration: BoxDecoration(

                          image: DecorationImage(
                            image: AssetImage('assets/logo.jpeg'),

                          )
                      ),
                    ),


                    SizedBox(
                      height: Height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" Join Blogry",style: GoogleFonts.aBeeZee(fontSize: 50,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Container(

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
                                        "Sign up with google",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              onTap: _handleSignIn

                                  // Fetch Logged in user Id
                                  // int id = await fetchLoggedInUserId();


                                /*  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyHomePage()),
                                  );*/


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
                                        "Sign up with facebook",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
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
                                        "Sign up with email",
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
                                            gmailsignup()),
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
                                    "Already  Have Account ?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        ),
                                  ),
                                  InkWell(onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Signin()
                                      ),
                                    );
                                  },
                                    child: Text(
                                      "Sign in",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          //  _buildBody()
                          ],
                        ),
                      ),
                    ),
                  ],
                )),

        );
  }

  Future<void> _handleSignIn() async{
    try{
      await _googleSignIn.signIn();
    }catch(error){
      print(error);
    }
  }


}







