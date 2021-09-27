import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '/store/action.dart' as action;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_app/main.dart';
import 'package:music_app/store/appState.dart';

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
      return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
    return Scaffold(
      appBar: AppBar(            
            elevation: 10,     
            backgroundColor:Colors.white ,       
            shadowColor: Colors.grey,
            centerTitle: true,
            title: TextField(
              onChanged: (value){
                if(value.isNotEmpty){
                 
               }
               },
              controller: _searchController,
              style:TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.black),
                hintText: "Search here...",
                fillColor: Colors.red,
              ),
            ),
            leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.chevron_left,color: Colors.black,)),
            actions: [ 
              TextButton(onPressed: (){
                store.dispatch(action.fetchSongSearch(context, _searchController.text.replaceAll(" ", "+")));}, 
                child: Text("Go",style: TextStyle(color: Colors.black),),
              ),
             
            ],
          ),
          body:  Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          width: MediaQuery.of(context).size.width, 
           child: 
           store.state.searchModel!.data == null ?  Container(
               height:  MediaQuery.of(context).size.height,
            child: Center(child: Text("Search here"))) :
           store.state.searchModel!.data!.isEmpty ?  Container(
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: Center(
                            child: Container(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: Color(0xffe41212),
                                  strokeWidth: 2,
                                )),
                          ),
                        )  :
          GridView.builder(            
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: 0.9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: store.state.searchModel!.data!.length,
             itemBuilder: (context,index){
              var item = store.state.searchModel!.data![index];
             
               return 
              !item.songName!.toLowerCase().contains( _searchController.text.toLowerCase()) ? Container():
              Card(
                child: Container(
                  height: 250,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Image.network(item.songImage.toString(),height: 90,width: 90,),                     
                        SizedBox(height: 8,),
                        Text(item.songName.toString().replaceAll("&quot;", ""),overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black),),
                      ],
                    ),
                  ),
              );
               }  ),),
    );
    });}}