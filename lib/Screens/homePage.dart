import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_app/Screens/search.dart';
import 'package:music_app/Screens/weeklyTop.dart';
import 'package:music_app/store/appState.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List img = ["http://c.saavncdn.com/274/Rockstar-2011-500x500.jpg","http://c.saavncdn.com/181/Happy-Hardy-And-Heer-Hindi-2019-20200120065920-500x500.jpg",
  "http://c.saavncdn.com/890/Saaho-Hindi-2019-20190828024546-500x500.jpg",
  "http://c.saavncdn.com/112/Bachna-Ae-Haseeno-Hindi-2008-20190329150948-500x500.jpg","http://c.saavncdn.com/003/TRIPLEE-SIXX-PART-1-Punjabi-2021-20210821025555-500x500.jpg",];
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey,
              title: Text(
                "Home",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            body: Container(
                decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(
                          "https://static.pexels.com/photos/1526/dark-blur-blurred-gradient-landscape.jpg"),
                      fit: BoxFit.fill,
                    )),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  SizedBox(height: 10,),
                  Row(children: [Text("Top Charts" ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.grey[350]),)],),
                  Divider(),
                  dailyTop(context),
                  weeklyTop(context),
                  romanticTop40(context),
                  Divider(),
                  songSearch(context), 
                  CarouselSlider(
                    items: img.map((item) {
                      print(["object",item]);
                      return  Container(child: Center(child: Image.network(item.toString())
                      ),); 
                   } ).toList(),
                    options: CarouselOptions(
                       // height: 150,
          aspectRatio: 0.8,
          autoPlay: true,
          viewportFraction: 0.7,
          initialPage: 0,
          enableInfiniteScroll: true,
          //autoPlayCurve: Curves.linear,
          enlargeCenterPage: true,
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
  }

  ElevatedButton songSearch(BuildContext context) {
    return ElevatedButton(
                  onPressed: (){
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Search()));
                  }, 
                  child: Text("Search Songs",style: TextStyle(color: Colors.black),),
                  style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.white54),
                  overlayColor:
                      MaterialStateProperty.all(Colors.blueGrey[100]),
                  shadowColor:
                      MaterialStateProperty.all(Colors.transparent),
                  padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                  minimumSize:MaterialStateProperty.all(Size(150,50)),
                ),
                );
  }

  ElevatedButton weeklyTop(BuildContext context) {
    return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WeeklyTop(category: "weeklyTop")));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    overlayColor:
                        MaterialStateProperty.all(Colors.blueGrey[100]),
                    shadowColor:
                        MaterialStateProperty.all(Colors.transparent),
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(right: 5, left: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [  
                        Text(
                          "Weekly top songs",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(Icons.chevron_right,
                            size: 30, color: Colors.white),
                      ],
                    ),
                  ),
                );
  }



ElevatedButton romanticTop40(BuildContext context) {
    return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WeeklyTop(category: "romanticTop40")));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    overlayColor:
                        MaterialStateProperty.all(Colors.blueGrey[100]),
                    shadowColor:
                        MaterialStateProperty.all(Colors.transparent),
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(right: 5, left: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [  
                        Text(
                          "Romantic Top 40 songs",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(Icons.chevron_right,
                            size: 30, color: Colors.white),
                      ],
                    ),
                  ),
                );
  }





  ElevatedButton dailyTop(BuildContext context) {
    return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WeeklyTop(category: "dailyTop")));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    overlayColor:
                        MaterialStateProperty.all(Colors.blueGrey[100]),
                    shadowColor:
                        MaterialStateProperty.all(Colors.transparent),
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(right: 5, left: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Daily top songs",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(Icons.chevron_right,
                            size: 30, color: Colors.white),
                      ],
                    ),
                  ),
                );
  }
}
