import 'dart:convert';
import 'package:audio_service/audio_service.dart';
import 'package:music_app/Screens/audioHandler.dart';
import 'package:music_app/models/musicDailyModel/daily_top_model.dart';
import 'package:music_app/models/musicModel/weekly_top_model.dart';
import 'package:music_app/models/songInfoModel.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'appState.dart';




//fetch Song By id
ThunkAction<AppState> fetchSongId(context) {
  print(['fetchSongId api running ']); 
  return (Store<AppState> store) async {
    var url = Uri.parse("https://saavn.me/song?id=f_MsPb4c");
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
      store.dispatch(WeeklyTopModel.fromJson(res));     
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







//fetch movies genere
// ThunkAction<AppState> fetchGenere(context) {
//   print(['fetchGenere api running ']); 
//   return (Store<AppState> store) async {
//     store.dispatch(Loader(showLoader: true));

//     var url = Uri.parse("https://data-imdb1.p.rapidapi.com/genres/");
//     var response = await http.get(url, headers: headers);
//     // print(response.body);
//     if (response.statusCode == 200) {
//       var res = jsonDecode(response.body);
//       List gen = res['Genres'];
//       // print(["action generedata res", res]);
//       List _newGen = [];
//       gen.map((element) async {
//         String? imgGen = await searchImage(element['genre']);
//         Map map = {"genre": "${element['genre']}", "imageUrl": "$imgGen"};
//         if (!_newGen.contains(map)) {
//           _newGen.add(jsonEncode(map));
//         }
//         store.dispatch(DiscoverApiModel.fromJson({"Genres": _newGen}));
//       }).toList();//    
//       store.dispatch(Loader(showLoader: false));
//     }
//   };
// }