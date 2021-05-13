import 'dart:math';

import 'package:blogry/app/ApiData.dart';
import 'package:blogry/app/appConstant.dart';
import 'package:blogry/app/appperferance.dart';
import 'package:blogry/main.dart';
import 'package:blogry/model/NewsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CategoryState();
  }

}
class CategoryState extends State<Category>{
  final _random = Random();
  // ignore: deprecated_member_use
  List <String> checkeddata=new List();
  // ignore: deprecated_member_use
  List<bool> checkbox=new List();
  bool valuefirst = false;
  @override
  void initState() {
    AppPreferences.getString(AppConstants.Token).then((value) {
      setState(() {
        ApiClient().CatograryList(value).then((value) {
          setState(() {
            Map<dynamic, dynamic> response =  value.data ;
            print(response);
          });

        });
      });
    });


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    for(int i=0; i<=NewsTopic.NewsTopics.length;i++){
    checkbox.add(false);}
    print(checkbox);
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Icon(Icons.forward_outlined),backgroundColor: Colors.orange,onPressed: (){
        if(checkeddata.isNotEmpty){
        AppPreferences.getString(AppConstants.Token).then((value) {
          print(value);
          setState(() {
            ApiClient().CatograrySelectionList(value,checkeddata).then((value) {setState(() {
print(value.data);

              if(value.statusCode==200){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MyHomePage()),
                );
              }

            });});
          });
        });

      }},),
appBar: AppBar(automaticallyImplyLeading: false,
  backgroundColor: Colors.orange
  ,title: Text("Choose Your Fav. Categories",style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),
),),
      body:
         GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount:  2 ),
              shrinkWrap: true,
                scrollDirection: Axis.vertical,

                itemCount: NewsTopic.NewsTopics.length,
                itemBuilder: (BuildContext context, int index) => Container(height: 100,
                  child: Card(
                      child:Card(
                          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          color:checkbox[index]==false?Colors.white:Colors.primaries[_random.nextInt(Colors.primaries.length)]
                          [_random.nextInt(9) * 100] ,
                          child: Container(

                            padding: const EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(NewsTopic.NewsTopics[index],
                                  style: GoogleFonts.aBeeZee(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                Container(

                                  child: Checkbox(
                                    checkColor: Colors.green,
                                    activeColor: Colors.black12,
                                    value:checkbox[index],
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.checkbox[index] = value;
                                        if(checkbox[index]==true){
                                          checkeddata.add(NewsTopic.NewsTopics[index]);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                  ),
                ),
               // staggeredTileBuilder: (int index) =>
              //  new StaggeredTile.fit(2),
              //  mainAxisSpacing: 4.0,
             //   crossAxisSpacing: 4.0,
              ),







    );
  }
}




