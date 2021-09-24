
import 'package:music_app/models/musicDailyModel/daily_top_model.dart';
import 'package:music_app/models/musicModel/weekly_top_model.dart';
import 'package:music_app/models/songInfoModel.dart';
import 'appState.dart';



//combine reducers
AppState appReducer(AppState state, action) {
  print('reducer running');
  return AppState(
    // loader: showLoader(state.loader as Loader, action),
    songInfoModel: songInfoReducer(state.songInfoModel as SongInfoModel, action),
    weeklyTopModel: weeklyTopModelReducer(state.weeklyTopModel as WeeklyTopModel, action),
    dailyTopModel: dailyTopModelReducer(state.dailyTopModel as DailyTopModel, action),
  );
}


// //loader reducer
// showLoader(Loader prevState, dynamic action) {
//   if (action is Loader) {
//     return action;
//   }
//   return prevState;
// }
 

//discoverApi reducer
songInfoReducer(SongInfoModel prevState, dynamic action) {
  if (action is SongInfoModel) {
    return action;
  }
  return prevState;
}


weeklyTopModelReducer(WeeklyTopModel prevState, dynamic action) {
  if (action is WeeklyTopModel) {    
    return action;
  }
  return prevState;
}

dailyTopModelReducer(DailyTopModel prevState, dynamic action) {
  if (action is DailyTopModel) {    
    return action;
  }
  return prevState;
}