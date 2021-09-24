import 'dart:convert';

import 'package:audio_service/audio_service.dart';
// import 'package:music_app/Screens/audioHandler.dart';
import 'package:music_app/models/musicDailyModel/daily_top_model.dart';
import 'package:music_app/models/musicModel/weekly_top_model.dart';
import 'package:music_app/models/songInfoModel.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'appState.dart';




//fetch Song By id
ThunkAction<AppState> fetchSongId(context,songId) {
  print(['fetchSongId api running ']); 
  return (Store<AppState> store) async {
    var url = Uri.parse("https://saavn.me/song?id=$songId");
    var response = await http.get(url);    
    if(response.statusCode==200){
      var res = jsonDecode(response.body);  
      print(response.body);
      store.dispatch(SongInfoModel.fromJson(res));    

    }    
    
  };
}


//fetch weekly top
ThunkAction<AppState> fetchWeeklyTop(context) {
  print(['fetchWeeklyTop api running ']); 
  return (Store<AppState> store) async {
    var url =Uri.parse("https://www.jiosaavn.com/api.php?__call=webapi.get&token=8MT-LQlP35c_&type=playlist&p=1&n=50&includeMetaTags=0&ctx=wap6dot0&api_version=4&_format=json&_marker=0");
    var response = await http.get(url);
    // print(["fetchWeeklyTop", response.body]);
    if(response.statusCode==200){
      var oldRes = response.body.replaceAll('"list":', '"data":');
      var res = jsonDecode(oldRes);
      // print(["fetchWeeklyTopDecoded", res]);    
      List data = res['data'];
      List playlistSongsUrls = [];
      data.map((e) async {
       String? downloadUrl = await fetchPlaylistSongDownloadUrl(context,e['id']);
       if(!playlistSongsUrls.contains(downloadUrl)){
         playlistSongsUrls.add(downloadUrl);
       }
       print(["downloadUrl",downloadUrl]);
      }).toList();
      Future.delayed(Duration(milliseconds: 3000),(){
  store.dispatch(WeeklyTopModel.fromJson(res));
  store.dispatch(PlaylistSongsUrls(playlistSongsUrls));    
      });
     
    }else{
      print(response.statusCode);
    }
  };
}


//fetch daily top
ThunkAction<AppState> fetchDailyTop(context) {
  print(['fetchDailyTop api running ']); 
  return (Store<AppState> store) async {
    var url =Uri.parse("https://www.jiosaavn.com/api.php?__call=webapi.get&token=I3kvhipIy73uCJW60TJk1Q__&type=playlist&p=1&n=50&includeMetaTags=0&ctx=wap6dot0&api_version=4&_format=json&_marker=0");
    var response = await http.get(url);
    // print(["fetchDailyTop", response.body]);
    if(response.statusCode==200){
      var oldRes = response.body.replaceAll('"list":', '"data":');
      var res = jsonDecode(oldRes);
      print(["fetchDailyTopDecoded", res]);    
      store.dispatch(DailyTopModel.fromJson(res));     
    }else{
      print(response.statusCode);
    }
  };
}










//class playlistSongsUrls
class PlaylistSongsUrls {
  List?playlistSongsUrls;
  PlaylistSongsUrls(this.playlistSongsUrls);

}

//fetch Song By id and store to list
Future<String?> fetchPlaylistSongDownloadUrl(context,songId) async {
  print(['fetchSongByIdStore api running ']); 
 
    var url = Uri.parse("https://saavn.me/song?id=$songId");
    var response = await http.get(url);    
    if(response.statusCode==200){
      var res = jsonDecode(response.body);  
      print(["fetchSongByIdStore",response.body]);
     return res['download_links'][1];

    }    
    

}