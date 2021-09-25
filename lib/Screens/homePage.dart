import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_app/Screens/weeklyTop.dart';
import 'package:music_app/store/appState.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
     return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,      
      builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa0a0a6),
        title: Text("Search Songs"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xffb3bdba),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children:[
              InkWell(
                onTap: (){
                  // store.dispatch(action.fetchWeeklyTop(context));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WeeklyTop(category:"weeklyTop" )));
                },
                child: Container(                
                  padding: EdgeInsets.only(right: 5,left: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Weekly top songs",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      Icon(Icons.chevron_right,size: 30,color: Colors.white),
                    ],
                  ),
                ),
              ),
               ElevatedButton(
                         onPressed: (){ 
                            Navigator.push(context, MaterialPageRoute(builder: (context) => WeeklyTop(category:"dailyTop")));                          
                         },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.blueGrey[100]),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  ),
                        child: Container(                
                  padding: EdgeInsets.only(right: 5,left: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Daily top songs",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      Icon(Icons.chevron_right,size: 30,color: Colors.white),
                    ],
                  ),
                ),
               ),          
             
            ]
          ),
        ),
      ),      
    );
  }
     );
  }
}
