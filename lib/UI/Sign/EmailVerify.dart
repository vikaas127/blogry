import 'package:blogry/app/ApiData.dart';
import 'package:blogry/app/appConstant.dart';
import 'package:blogry/app/appdata.dart';
import 'package:blogry/app/appperferance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';

import '../Category.dart';

class EmailVerify  extends  StatefulWidget{
   // ignore: non_constant_identifier_names
   final  String Email;
  const EmailVerify ({
    // ignore: non_constant_identifier_names
    Key key, @required this.Email,
  });

  @override
  State<StatefulWidget> createState() {
return EmailVerifyState();
  }

}
class EmailVerifyState extends State<EmailVerify>{
  String otpoutput;
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    double Height= AppTheme.fullHeight(context);
 return  Scaffold(

   body:
   ListView(shrinkWrap: true,
     scrollDirection: Axis.vertical,
     children: [
       SizedBox(
         height: Height * 0.15,
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
         height: Height * 0.05,
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Card(
           child: Column(
             children: [

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("Verify Email Address",style: GoogleFonts.aBeeZee(fontSize: 23,fontWeight: FontWeight.bold),),
               ),
               SizedBox(height: 20,),

               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("Enter the 4-digit verification code sent to"

                     ,
                   style: GoogleFonts.aBeeZee(fontSize: 12,fontWeight: FontWeight.bold),),
               ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                   child: Text(
                       "${widget.Email}"
                     ,
                     style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.bold),),
                 ),
               ),
               SizedBox(height: 20,),
          OTPTextField(
           length: 4,
           width: MediaQuery.of(context).size.width,
           textFieldAlignment: MainAxisAlignment.spaceAround,
           fieldWidth: 50,

           style: TextStyle(
               fontSize: 17
           ),
           onChanged: (pin) {
             print("Changed: " + pin);
           },
           onCompleted: (pin) {
             print("Completed: " + pin);
             if(pin=="1234"){
               otpoutput=pin;
              print("success") ;
             }
           },
         ),
               SizedBox(height: 40,),

             ],
           ),
         ),
       ),
       SizedBox(
         height: Height * 0.10,
       ),
       InkWell(
         onTap: (){
if(otpoutput=="1234")
  ApiClient().verifyOTP(otpoutput,widget.Email).then((value) {setState(() {
    var response= value.data;
    AppPreferences.setString(AppConstants.Token, response['token'].toString().split(" ").last);
    AppPreferences.setBool(AppConstants.Auth_Token, true);

    print(response['token'].toString().split(" ").last);
    print(response);
    if(value.statusCode==200){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                Category()),
      );
    }
  });});

         },
         child: Padding(
           padding: const EdgeInsets.symmetric( horizontal: 90.0),
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
               child:  Text(
                 "Verify",
                 style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold),
               ),
             ),
           ),
         ),
       ),
     ],),

   );

  }

}