import 'dart:math';

import 'package:blogry/model/NewsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }

}
class SearchState extends State<Search>{
  final _random = Random();

  @override
  Widget build(BuildContext context) {
  return Scaffold(

    body:
    Column(
      children: [
        Padding(
          padding: EdgeInsets.all(30.0),
          child: Container(
            // height: Height * 0.70,
            child: Column(
              children: <Widget>[

                SizedBox(height: 40,),
                Container(
                  height: 50,

                  child:




                  new TextFormField(

                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search_outlined),
                      hintText: 'Search',
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                    ),


                  ),



                ),



              ],
            ),
          ),
        ),



    Expanded(
                 child: StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 4,
                  itemCount: NewsTopic.NewsTopics.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child:Card(
                      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      color: Colors.primaries[_random.nextInt(Colors.primaries.length)]
                      [_random.nextInt(9) * 100],
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        child: Text(NewsTopic.NewsTopics[index],
                          style: GoogleFonts.aBeeZee(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ),
                  staggeredTileBuilder: (int index) =>
                  new StaggeredTile.fit(2),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
              ),
               ),



      ],
    ),
  );
  }
}




