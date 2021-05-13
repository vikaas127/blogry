
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  static Future<void> show(
      BuildContext context, {
        @required VoidCallback onEdit,
      }) {
    return showDialog(
      context: context,
      builder: (_) => EditProfile._(
        onDelete: onEdit,
      ),
    );
  }

  const EditProfile._({
    @required this.onDelete,
    Key key,
  })  : assert(onDelete != null),
        super(key: key);
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
       Column(
         children: [
           new Container(height: 120,width: MediaQuery.of(context).size.width,
            child: Row(
            children: [
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

                //controller: tetEmail,
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

            ],
      ),

      ),
           TextButton(
             onPressed: () {
               onDelete?.call();
               Navigator.pop(context);
             },
             child: Text(
               "edit",
               style: TextStyle(color: Theme.of(context).colorScheme.primary),
             ),
           ),
         ],
       ));




  }
}
