import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_app/store/appState.dart';
import 'package:music_app/store/reducer.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:music_app/Screens/homePage.dart';
import 'package:redux/redux.dart';

import 'packages/auidoPlayer/services/service_locator.dart';
import 'splashScreen/splashScreen.dart';
// Redux
final store = Store<AppState>(appReducer,
    middleware: [thunkMiddleware], initialState: AppState.initial());
// late AudioHandler audioHandler;

Future<void> main() async {
  await setupServiceLocator();
  runApp(StoreProvider(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(      
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}


