import 'dart:convert';
import 'package:audio_service/audio_service.dart';
import 'package:music_app/models/PlaylistSongsUrls.dart';
import 'package:music_app/models/musicModel/weekly_top_model.dart';
import 'package:music_app/models/searchModel/search_model.dart';
import 'package:music_app/models/songInfoModel.dart';
import 'package:music_app/packages/auidoPlayer/page_manager.dart';
import 'package:music_app/packages/auidoPlayer/services/service_locator.dart';
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
      // print(response.body);
      store.dispatch(SongInfoModel.fromJson(res));  
    } 
  };
}

ThunkAction<AppState> fetchSongSearch(context,songSearch) {
  print(['fetchSongId api running ']); 
  return (Store<AppState> store) async {
    var url = Uri.parse("https://saavn.me/search?song=$songSearch");
    var response = await http.get(url);    
    if(response.statusCode==200){
      var res = jsonDecode(response.body);  
      print(response.body);
      store.dispatch(SearchModel.fromJson({"data":res}));  
    } 
  };
}

//fetch Song By id and store to list
Future<String?> fetchPlaylistSongDownloadUrl(context,songId) async {
  print(['fetchSongByIdStore api running ']);  
    var url = Uri.parse("https://saavn.me/song?id=$songId");
    var response = await http.get(url);    
    if(response.statusCode==200){
      var res = jsonDecode(response.body);  
      // print(["fetchSongByIdStore",response.body]);
     return res['download_links'][1];
    }
}


//fetch weekly top
ThunkAction<AppState> fetchWeeklyTop(context,value) {
  print(['fetchWeeklyTop api running ']); 
  return (Store<AppState> store) async {
    var url ;
     if(value == "dailyTop"){
   url =   Uri.parse("https://www.jiosaavn.com/api.php?__call=webapi.get&token=I3kvhipIy73uCJW60TJk1Q__&type=playlist&p=1&n=50&includeMetaTags=0&ctx=wap6dot0&api_version=4&_format=json&_marker=0");
     } else if(value == "romanticTop40"){
   url =   Uri.parse("https://www.jiosaavn.com/api.php?__call=webapi.get&token=m9Qkal5S733ufxkxMEIbIw__&type=playlist&p=1&n=50&includeMetaTags=0&ctx=wap6dot0&api_version=4&_format=json&_marker=0");       
     }
     else{
   url = Uri.parse("https://www.jiosaavn.com/api.php?__call=webapi.get&token=8MT-LQlP35c_&type=playlist&p=1&n=50&includeMetaTags=0&ctx=wap6dot0&api_version=4&_format=json&_marker=0");
  }
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
      //  print(["downloadUrl",downloadUrl]);
      }).toList();
      final _audioHandler = getIt<AudioHandler>();
      List mediaItems = _audioHandler.queue.value;
      if(mediaItems.isNotEmpty){
      for(int i=0;  i <= mediaItems.length;i++){
print(["iiiiiii",i]);
_audioHandler.removeQueueItemAt(i);
}
}
      // mediaItems.map((e) {
      //   int index = mediaItems.indexOf(e);

      // }).toList();
    // _audioHandler.removeQueueItemAt(0);
   await   Future.delayed(Duration(milliseconds: 1500),(){
     
  store.dispatch(WeeklyTopModel.fromJson(res));
  store.dispatch(PlaylistSongsUrls(playlistSongsUrls));   
 
      });
     Future.delayed(Duration(seconds: 1000),(){
     
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
      List data = res['data'];
      List playDailyTopSongsUrls = [];
      data.map((e) async {
        String? dailySongUrl = await fetchPlaylistSongDownloadUrl(context,e['id']);
        if(!playDailyTopSongsUrls.contains(dailySongUrl)){
          playDailyTopSongsUrls.add(dailySongUrl);
        }
        print(["dailySongUrl",dailySongUrl]);
      }).toList;
      print(["fetchDailyTopDecoded", res]);    
      Future.delayed(Duration(milliseconds: 3000),(){
       store.dispatch(WeeklyTopModel.fromJson(res));  
       store.dispatch(PlayDailyTopSongsUrls(playDailyTopSongsUrls));
      });
    }else{
      print(response.statusCode);
    }
  };
}

addToQueue(){
  print("addToQueue");
    getIt<PageManager>().init();
  final _audioHandler = getIt<AudioHandler>();
                      final mediaItems1 = store.state.weeklyTopModel!.data!.map((song) {
        int index = store.state.weeklyTopModel!.data!.indexOf(song);
        String url = store
            .state
            .playlistSongsUrls![
                index == (store.state.weeklyTopModel!.data!.length - 1)
                    ? 0
                    : index]
            .toString();
       
        return index == (store.state.weeklyTopModel!.data!.length - 1)
            ? MediaItem(id: "asdasdasd", title: "", extras: {
                'url':
                    "https://aac.saavncdn.com/264/eb5bf3908be1c26cfda000e615c647d6_160.mp4"
              })
            : MediaItem(
                id: song.id ?? '',
                album: song.shershaah ?? '',
                artUri: Uri.parse(song.image.toString()),
                title: song.title ?? '',
                extras: {'url': url},
              );
      }).toList();
      
      _audioHandler.addQueueItems(mediaItems1);
}