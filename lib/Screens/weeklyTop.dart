import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_app/models/musicModel/datum.dart';
import '/store/action.dart' as action;
import 'package:music_app/main.dart';
import 'package:music_app/store/appState.dart';

class WeeklyTop extends StatefulWidget {
  WeeklyTop({Key? key}) : super(key: key);

  @override
  _WeeklyTopState createState() => _WeeklyTopState();
}

class _WeeklyTopState extends State<WeeklyTop> {
  @override
  void initState() {
    super.initState();
    store.dispatch(action.fetchWeeklyTop(context));
  }
  @override
  Widget build(BuildContext context) {
    return  StoreConnector<AppState, AppState>(
      converter: (store) => store.state,      
      builder: (context, state) {
    return Scaffold(      
      appBar: AppBar(
        leading:IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.chevron_left,color: Colors.black,),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container( child: Text(store.state.weeklyTopModel!.title.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: 
      store.state.weeklyTopModel!.data == null ? 
                  Container(
                          height: MediaQuery.of(context).size.height/2,
                          child: Center(
                            child: Container(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                  strokeWidth: 2,
                                )),
                          ),
                        )
                  :
        Container(      
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 0),
          width: MediaQuery.of(context).size.width,        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [  
                  Container(
                    height: 300,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                        image: NetworkImage(store.state.weeklyTopModel!.image.toString()),
                        fit: BoxFit.fill
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),               
                  Container(
                    child:ListView.builder(
                      itemCount: store.state.weeklyTopModel!.data ==null ?1 :store.state.weeklyTopModel!.data!.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index){
                      Datum item =  store.state.weeklyTopModel!.data![index];
                      return ElevatedButton(
                         onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    overlayColor: MaterialStateProperty.all(Colors.blueGrey[100]),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
                  ),
                        child: ListTile(
                        leading: Image.network(item.image.toString()),
                        trailing: Icon(Icons.chevron_right),
                        title:Text(item.title.toString().replaceAll("&quot;", ""),overflow: TextOverflow.ellipsis),
                        subtitle: Text(item.subtitle.toString().replaceAll("&quot;", ""),overflow: TextOverflow.ellipsis),                    
                        ),
                      );
                      }
                    ),
                   ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    }
    );
  }
}