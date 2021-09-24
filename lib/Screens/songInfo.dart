import 'package:audio_service/audio_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/Screens/rt.dart';
import 'package:music_app/main.dart';
import 'package:music_app/store/appState.dart';
import 'package:rxdart/rxdart.dart';
import '/store/action.dart' as action;
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

import 'audioHandler.dart';
import '../main.dart';

class SongInfo extends StatefulWidget {
  SongInfo({Key? key}) : super(key: key);

  @override
  _SongInfoState createState() => _SongInfoState();
}


class _SongInfoState extends State<SongInfo> {
  // AudioPlayer audioPlayer = AudioPlayer();
 
  bool isPlaying = false;
  int? milliSec;
  double volume = 0.5;
  int? currentPos = 0;
  @override
  void initState() {
    super.initState();
    store.dispatch(action.fetchSongId(context));
  }

  @override
  void dispose() {
    // audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        rebuildOnChange: true,
        onInitialBuild: (state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffa0a0a6),
              title: Text(
                "Info",
                style: TextStyle(fontSize: 20),
              ),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0xffb3bdba),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  headAndImage(context),
                  Divider(
                    color: Colors.black,
                  ),
                  downloads(),
                  Divider(
                    color: Colors.black,
                  ),
                  favAndAddToList(),
                  Divider(
                    color: Colors.black,
                  ),
                  TextButton(onPressed: ()async{
  final _item = MediaItem(
    id:store.state.songInfoModel!.downloadLinks!.first.toString(),
    album: store.state.songInfoModel!.albumName,
    title: store.state.songInfoModel!.songName.toString().split("(").toList().first,
    artist: store.state.songInfoModel!.songArtist,
    // duration: const Duration(seconds: 60),
    artUri: Uri.parse(store.state.songInfoModel!.songImage.toString()),
  
  );


 final BehaviorSubject<MediaItem?> mediaItem = BehaviorSubject.seeded(null);


//  mediaItem.add(_item);
  await  player.setAudioSource(AudioSource.uri(Uri.parse(store.state.songInfoModel!.downloadLinks!.first.toString())));

// player.play();
 mediaItem.close();

                  }, child: Text("initial")),
                  // player(),
                  StreamBuilder(
                    stream: audioHandler.mediaItem,
                    builder: (context, snapshot) {
                     final mediaItem = snapshot.data;
                     return Text("demo");
                    },
                  ),
                   StreamBuilder<bool>(
              stream: audioHandler.playbackState
                  .map((state) => state.playing)
                  .distinct(),
              builder: (context, snapshot) {
                final playing = snapshot.data ?? false;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _button(Icons.fast_rewind, audioHandler.rewind),
                    if (playing)
                      _button(Icons.pause, audioHandler.pause)
                    else
                      _button(Icons.play_arrow, audioHandler.play),
                    _button(Icons.stop, audioHandler.stop),
                    _button(Icons.fast_forward, audioHandler.fastForward),
                  ],
                );
              },
            ),
            StreamBuilder<MediaState>(
              stream: _mediaStateStream,
              builder: (context, snapshot) {
                final mediaState = snapshot.data;
                return SeekBar(
                  duration: mediaState?.mediaItem?.duration ?? Duration.zero,
                  position: mediaState?.position ?? Duration.zero,
                  onChangeEnd: (newPosition) {
                    audioHandler.seek(newPosition);
                  },
                );
              },
            ),
              StreamBuilder<AudioProcessingState>(
              stream: audioHandler.playbackState
                  .map((state) => state.processingState)
                  .distinct(),
              builder: (context, snapshot) {
                final processingState =
                    snapshot.data ?? AudioProcessingState.idle;
                return Text(
                    "Processing state: ${describeEnum(processingState)}");
              },
            ),
                ],
              ),
            ),
          );
        });
  }

  // Widget player() {
  //   return StreamBuilder<Duration>(
  //     stream: audioPlayer.onAudioPositionChanged,
  //     builder: (context, snapshot) {
  //       return Column(
  //         children: [
  //           Text("time: ${snapshot.data}"),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               IconButton(
  //                   onPressed: () async {
  //                     await audioPlayer.setVolume(volume - 0.1);
  //                   },
  //                   icon: Icon(Icons.remove)),
  //               IconButton(
  //                   onPressed: () async {
  //                     int m = await audioPlayer.getDuration();
  //                     setState(() {
  //                       milliSec = m;
  //                     });
  //                     print(["audioPlayer.getDuration()", m]);
  //                   },
  //                   icon: Icon(Icons.arrow_back_ios)),
  //               IconButton(
  //                   onPressed: () {
  //                     setState(() {
  //                       if (!isPlaying) {
  //                         audioPlayer.play(
  //                             "https://aac.saavncdn.com/264/eb5bf3908be1c26cfda000e615c647d6_160.mp4");
  //                       } else {
  //                         audioPlayer.pause();
  //                       }
  //                       isPlaying = !isPlaying;
  //                     });
  //                   },
  //                   icon: Icon(isPlaying ? Icons.pause : Icons.play_circle)),
  //               IconButton(
  //                   onPressed: () async {
  //                     int m = await audioPlayer.getCurrentPosition();
  //                     await audioPlayer.seek(Duration(milliseconds: m + 15000));
  //                     print(["currentPos", m, milliSec]);
  //                     setState(() {
  //                       currentPos = m;
  //                     });
  //                   },
  //                   icon: Icon(Icons.arrow_forward_ios)),
  //               IconButton(
  //                   onPressed: () async {
  //                     int m = await audioPlayer.setVolume(1);
  //                     print(["vloume", m]);
  //                   },
  //                   icon: Icon(Icons.add)),
  //             ],
  //           ),
  //           Slider(
  //             value: snapshot.data == null
  //                 ? 0.0
  //                 : snapshot.data!.inMilliseconds.toDouble(),
  //             onChanged: (value) async {
  //               print(value);
  //               await audioPlayer.seek(Duration(milliseconds: value.toInt()));
  //             },
  //             min: 0.0,
  //             max: milliSec == null ? 1.0 : milliSec!.toDouble(),
  //           )
  //         ],
  //       );
  //     },
  //   );








//      Column(children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [

//             IconButton(onPressed: () async {
//             int m = await  audioPlayer.getDuration();
//             setState(() {
//               milliSec = m;
//             });
//               print(["audioPlayer.getDuration()",m]);
//             },icon: Icon(Icons.arrow_back_ios)),
//                IconButton(onPressed: (){

// setState(() {

//   if(!isPlaying){
//      audioPlayer.play("https://aac.saavncdn.com/264/eb5bf3908be1c26cfda000e615c647d6_160.mp4");
//   }else{
//     audioPlayer.pause();
//   }
//     isPlaying = !isPlaying;
// });
//                },icon: Icon(
//                  isPlaying ? Icons.pause :
//                  Icons.play_circle)),
//                   IconButton(onPressed: () async {
//                     // audioPlayer.seek(Duration(seconds: 10));
//                   int m =await  audioPlayer.getCurrentPosition();
//                   print(["currentPos",m,milliSec]);
//                   setState(() {
//                     currentPos = m;
//                   });
//                   },icon: Icon(Icons.arrow_forward_ios)),

//           ],),
//           Slider(value: currentPos!.toDouble(), onChanged: (value){},
//           min: 0.0,
//           max:milliSec == null ? 1.0: milliSec!.toDouble() ,
//           )
//     ],);
  }

  Row favAndAddToList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffa0a0a6)),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Favourite",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffa0a0a6)),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Add to List",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column downloads() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Download :",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Aar()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal[200]),
              ),
              child: Container(
                child: Center(
                  child: Text(
                    "96 Kbps",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal[200]),
              ),
              child: Container(
                child: Center(
                  child: Text(
                    "160 Kbps",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal[200]),
              ),
              child: Container(
                child: Center(
                  child: Text(
                    "320 Kbps",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row headAndImage(BuildContext context) {
    var unescape = HtmlUnescape();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2.2,
          padding: EdgeInsets.only(top: 10),
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
               // unescape.convert(store.state.songInfoModel!.songName.toString())    ,
               store.state.songInfoModel!.songName.toString().split("(").toList().first, 
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Album Name",
                style: TextStyle(color: Colors.grey[300], fontSize: 15),
              ),
              Text(
                "by Song artist",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                "Song . ---sec.",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              // Text("Year: ",style: TextStyle(color: Colors.white,fontSize: 15),),
              // Text("Song release date: ",style: TextStyle(color: Colors.white,fontSize: 15),),

              // Text("Song label: ",style: TextStyle(color: Colors.white,fontSize: 15),),
              // Text("Song language: ,Song copyright: ",style: TextStyle(color: Colors.white,fontSize: 15),),
            ],
          ),
        ),
        Container(
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  NetworkImage(store.state.songInfoModel!.songImage.toString()),
              fit: BoxFit.fill,
            ),
          ),
          width: MediaQuery.of(context).size.width / 2.2,
        ),
      ],
    );
  }

 Stream<MediaState> get _mediaStateStream =>
      Rx.combineLatest2<MediaItem?, Duration, MediaState>(
          audioHandler.mediaItem,
          AudioService.position,
          (mediaItem, position) => MediaState(mediaItem, position));

  IconButton _button(IconData iconData, VoidCallback onPressed) => IconButton(
        icon: Icon(iconData),
        iconSize: 64.0,
        onPressed: onPressed,
      );

