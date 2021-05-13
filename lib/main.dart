import 'dart:io';

import 'package:blogry/UI/Blog/BlogWrite.dart';
import 'package:blogry/UI/Search.dart';
import 'package:blogry/UI/WorkPlace.dart';
import 'package:blogry/model/NewsArticle.dart';
import 'package:blogry/model/NewsHelper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'UI/Profilem.dart';
import 'UI/Splash.dart';
GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  var  totalitems=0;
  Color colora=Colors.white;
 // ProgressDialog pr;
 PageController _pageController= new PageController();
 @override
 void initState() {
   super.initState();
  // getcartProducts();

   _pageController = PageController();
 }
bool bottombar= false;
 @override
 void dispose() {
   _pageController.dispose();
   super.dispose();
 }
  Widget customBottomNavigationBar(BuildContext context){
  //  double myHeight =100.0;//Your height HERE
    return SizedBox(
     // height: myHeight,
      width: MediaQuery.of(context).size.width,
      child:TabBar(
        
        onTap:(index) {
          _pageController.jumpToPage(index);
        } ,
        tabs: [
          Tab(  icon: Icon(Icons.home, size: 36.0) ),
          Tab(  icon: Icon(Icons.search, size: 36.0) ),
          Tab( icon: Icon(Icons.account_circle, size: 36.0) ),
          Tab(  icon: Icon(Icons.work, size: 36.0) ),
          Tab( icon: Icon(Icons.notifications, size: 36.0) ),
        ],
        automaticIndicatorColorAdjustment: true,
        labelStyle: TextStyle(fontSize: 12.0),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.black,
      ),
    );
  }
  bool isOpen = false;

  _toggleShare() {
    setState(() {
      isOpen = !isOpen;
    });
  }


  double yTransValue = 0;
  @override
  Widget build(BuildContext context) {

    return /*NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
      print(notification.metrics.axisDirection);
      print(notification.metrics.axis);

      if (notification.scrollDelta.sign == 1) {
        setState(() {
          yTransValue = 100;
        });
      } else if (notification.scrollDelta.sign == -1) {
        setState(() {
          yTransValue = 0;
        });
      }
    },child:*/DefaultTabController(
    length: 5,child:
    Scaffold(
      bottomNavigationBar:bottombar==true?


    AnimatedContainer(
    duration: Duration(milliseconds: 300),
    transform: Matrix4.translationValues(0, yTransValue, 0),
    child: SizedBox(

    height: 96,

    child: Padding(
      padding: const EdgeInsets.only(left:48.0,right: 48.0,bottom: 40),
      child: Card(

         shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
shadowColor: Colors.black,
        borderOnForeground: true,



          child:customBottomNavigationBar(context)
        /*BottomNavigationBar(
                    unselectedLabelStyle: TextStyle(color: Colors.grey),
                    selectedLabelStyle: TextStyle(color: Colors.black),
                    backgroundColor: Colors.white,
                    currentIndex: _currentIndex,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,


                    onTap: (index) {
                      setState(() => _currentIndex = index);
                      _pageController.jumpToPage(index);
                    },
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home,
                          color: Colors.grey,
                        ),
                        title:Text('Profile',style: TextStyle(color: Colors.black),),
                        backgroundColor: Colors.white,

                        activeIcon: Icon(Icons.home,
                          color: Colors.black,
                        ),
                      ),

                      BottomNavigationBarItem(
                        icon: Icon(Icons.search_outlined,
                          color: Colors.grey,
                        ),
                        title:Text('Profile',style: TextStyle(color: Colors.black),),
                        backgroundColor: Colors.white,

                        activeIcon: Icon(Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle_outlined,
                          color: Colors.grey,
                        ),
                        title:Text('Profile',style: TextStyle(color: Colors.black),),
                        backgroundColor: Colors.white,

                        activeIcon: Icon(Icons.account_circle,
                          color: Colors.black,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.work_outline,
                          color: Colors.grey,
                        ),
                        title:Text('Profile',style: TextStyle(color: Colors.black),),
                        backgroundColor: Colors.white,

                        activeIcon: Icon(Icons.work,size: 24,
                          color: Colors.black,
                        ),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.notifications_none,
                          color: Colors.grey,
                        ),
                        title:Text('Profile',style: TextStyle(color: Colors.black),),
                        backgroundColor: Colors.white,

                        activeIcon: Icon(Icons.notifications,size: 24,
                          color: Colors.black,
                        ),
                      ),

                    ],
                  ),*/



                // TODO: implement build







      )),
    ),):Container(height: 10,),
floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:Stack(children: [




    AnimatedContainer(
    duration: const Duration(milliseconds: 350),
    curve: Curves.fastOutSlowIn,
    width: isOpen ? 300 : 48,
    height: 50,
    decoration: ShapeDecoration(
    color: Colors.grey[400],
    shape: StadiumBorder(),
    ),
    ),
    Container(
    width: 40,
    margin: const EdgeInsets.only(left: 4),
    decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    ),
    child: AnimatedCrossFade(
    duration: const Duration(milliseconds: 450),
    firstChild: IconButton(
    icon: Icon(Icons.create),
    onPressed: () => _toggleShare(),
    ),
    secondChild: IconButton(
    icon: Icon(Icons.close),
    onPressed: () => _toggleShare(),
    ),
    crossFadeState: !isOpen
    ? CrossFadeState.showFirst
        : CrossFadeState.showSecond,
    ),
    ),
    AnimatedOpacity(
    duration: const Duration(milliseconds: 450),
    opacity: isOpen ? 1 : 0,
    child: Container(
    width: 280,
    padding: const EdgeInsets.only(left: 40),
    child: TabBar(

      onTap:(index) {
        _pageController.jumpToPage(index);
      } ,
      tabs: [
        Tab(  icon: Icon(Icons.home, size: 36.0) ),
        Tab(  icon: Icon(Icons.search, size: 36.0) ),
        Tab( icon: Icon(Icons.account_circle, size: 36.0) ),
        Tab(  icon: Icon(Icons.work, size: 36.0) ),
        Tab( icon: Icon(Icons.notifications, size: 36.0) ),
      ],
      automaticIndicatorColorAdjustment: true,
      labelStyle: TextStyle(fontSize: 12.0),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.black,
    ),
    ),
    ),
    ]),
      /*FloatingActionButton(
          backgroundColor:Colors.white,
          onPressed:(){
            setState(() {
              bottombar=!bottombar;
              print(bottombar);
            });

          },child: Icon(Icons.build,color: Colors.grey,)),*/
      body: PageView(
        onPageChanged: (index) {
        },
        scrollDirection: Axis.vertical,
        controller:_pageController ,
        children: [
          Home(),
          Search(),
          Profile(),
          WorkPlace(),
         // Notification(),

        ],
      ),
    ));

  }
}
class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}
class HomeState extends State<Home>{

  @override
  Widget build(BuildContext context) {
  return Scaffold

    (
    endDrawerEnableOpenDragGesture: true,
    endDrawer:  Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32.0,64.0,32.0,16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.account_circle, size: 90.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Vikas Yadav", style: TextStyle(fontSize: 20.0),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("See profile", style: TextStyle(color: Colors.black45),),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40.0,16.0,40.0,40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text("Become a member", style: TextStyle(fontSize: 18.0, color: Colors.teal),),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("New Story", style: TextStyle(fontSize: 18.0),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Saved Blogs", style: TextStyle(fontSize: 18.0),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Logout", style: TextStyle(fontSize: 18.0),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    appBar:new AppBar(
      actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) =>  CircleAvatar(
              radius: 30,
            //  maxRadius: 40,
              backgroundColor: Colors.deepOrangeAccent,
              child:

                IconButton(icon: Icon(Icons.edit,color: Colors.white,size: 35,), onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        BlogWrite()),
              );





            }),)
      ))],
      title: new Text("Logo", style: TextStyle(color:Colors.black,fontWeight: FontWeight.w400),),
      centerTitle: false,
      backgroundColor: Colors.white,

    ),
    body:
    // Center is a layout widget. It takes a single child and positions it
    // in the middle of the parent.
    ListView(
      shrinkWrap: true,
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Today's Deal",style: GoogleFonts.aclonica(fontSize: 22),),

        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: NewsHelper.articleCount,
            itemBuilder: (context,index){
              NewsArticle article = NewsHelper.getArticle(index);
              return Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(article.categoryTitle, style: GoogleFonts.aBeeZee(color: Colors.black38,fontWeight: FontWeight.w500, fontSize: 12.0),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0,2.0,0.0,2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(child: Text(article.title, style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 15.0),), flex: 3,),
                            Flexible(
                              flex: 1,
                              child: Container(
                                  height: 80.0,
                                  width: 80.0,

                                  child: Image.asset("assets/" + article.imageAssetName, fit: BoxFit.cover,)

                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(article.author, style: GoogleFonts.aBeeZee(fontSize: 12.0),),
                              Text(  article.readTime, style: GoogleFonts.aBeeZee(color: Colors.black45, fontWeight: FontWeight.w500),)
                            ],
                          ),
                          Icon(Icons.bookmark_border),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                ),

              )
              ;



            }
          // Column is also a layout widget. It takes a list of children and



        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Topic For You",style: GoogleFonts.aclonica(fontSize: 22),),

        ),
        Container(
          height: 100,
          child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: NewsTopic.NewsTopics.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 8, bottom: 12),
                  child: Container(
                    height: 100,
                    width: 100,

                    decoration: BoxDecoration(
                      image:DecorationImage( image:AssetImage('assets/cars.jpeg'), fit: BoxFit.cover,),
                      color: Colors.red,
                      border: Border.all(
                        color: Colors.black26,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Center(child: Text(e.toString(),style: GoogleFonts.aclonica(fontSize: 13,color: Colors.white), )),

                    ),
                  ),
                );


              }).toList()),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: NewsHelper.articleCount,
            itemBuilder: (context,index){
              NewsArticle article = NewsHelper.getArticle(index);
              return Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(article.categoryTitle, style: GoogleFonts.aBeeZee(color: Colors.black38,fontWeight: FontWeight.w500, fontSize: 12.0),),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0,2.0,0.0,2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(child: Text(article.title, style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold, fontSize: 15.0),), flex: 3,),
                            Flexible(
                              flex: 1,
                              child: Container(
                                  height: 80.0,
                                  width: 80.0,
                                  child:
                                  Image.asset("assets/" + article.imageAssetName, fit: BoxFit.cover,)

                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(article.author, style: GoogleFonts.aBeeZee(fontSize: 12.0),),
                              Text(article.date + " . " + article.readTime, style: GoogleFonts.aBeeZee(color: Colors.black45, fontWeight: FontWeight.w500),)
                            ],
                          ),
                          Icon(Icons.bookmark_border),
                        ],
                      ),
                      Divider()
                    ],
                  ),
                ),

              )
              ;



            }
          // Column is also a layout widget. It takes a list of children and



        ),



      ],
    ),

    // This trailing comma makes auto-formatting nicer for build methods.
  );

  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}