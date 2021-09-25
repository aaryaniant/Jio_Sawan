import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_app/Screens/homePage.dart';
import '/store/action.dart' as action;
import '../main.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var songId;

  @override
  void initState() {    
    super.initState();

      store.dispatch(action.fetchSongId(context,songId));
    // store.dispatch(action.fetchWeeklyTop(context));
    // store.dispatch(action.fetchDailyTop(context));
    // store.dispatch(action.fetchPlaylistSongDownloadUrl(context));
    Timer(Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePageScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         decoration: BoxDecoration(
          //  image: DecorationImage(
            //  image: AssetImage("assets/image/splashScreen.png"),
            //  fit: BoxFit.fill,
          //  ),
         ),
         child: Center(
           child: Text("music",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
         ),
       ),
    );
  }
}