import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:music_app/main.dart';
import 'package:music_app/models/PlaylistSongsUrls.dart';
import 'package:music_app/packages/auidoPlayer/page_manager.dart';
import 'package:music_app/packages/auidoPlayer/services/playlist_repository.dart';
import 'package:music_app/packages/auidoPlayer/services/service_locator.dart';
import 'package:music_app/store/action.dart';
import 'package:music_app/store/appState.dart';

import 'notifiers/play_button_notifier.dart';
import 'notifiers/progress_notifier.dart';
import 'notifiers/repeat_button_notifier.dart';
import 'package:html_unescape/html_unescape.dart' ;
class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  void initState() {
    super.initState();
    getIt<PageManager>().init();
  }

  @override
  void dispose() {    
  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:
      StoreConnector<AppState, AppState>(
      converter: (store) => store.state,   
      rebuildOnChange: true,   
      builder: (context, state) {
    return 
       Scaffold(
        appBar: AppBar(
          actions:[ IconButton(onPressed: () async {
      final _audioHandler = getIt<AudioHandler>();
      List<MediaItem> mediaItems = _audioHandler.queue.value;
   
    
      for(int i=0;  i <= mediaItems.length;i++){
// await Future.doWhile(() {
  // print(i);
_audioHandler.removeQueueItemAt(i);
List? my = store.state.playlistSongsUrls;
my!.removeAt(i);
 store.dispatch(PlaylistSongsUrls(my));   
 
// return i == mediaItems.length;
// });
}
          }, icon: Icon(Icons.delete)),]
        ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                    // CurrentSongTitle(),
                // Playlist(),
                // AddRemoveSongButtons(),
                AudioProgressBar(),
                AudioControlButtons(),
              ],
            ),
          ),
        );})
    );
 
  }
}

class CurrentSongTitle extends StatelessWidget {
  const CurrentSongTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<String>(
      valueListenable: pageManager.currentSongImageNotifier,
      builder: (_, image, __) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.network(image,width: 300,height: 300,fit: BoxFit.cover,),
        );
      },
    );
  }
}

class Playlist extends StatelessWidget {
  const Playlist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return Expanded(
      child: ValueListenableBuilder<List<String>>(
        valueListenable: pageManager.playlistNotifier,
        builder: (context, playlistTitles, _) {
          return ListView.builder(
            itemCount: playlistTitles.length,
            itemBuilder: (context, index) {
           ValueNotifier<String> title =    pageManager.currentSongTitleNotifier;
        
              return ListTile(
                onTap: () async {
                   final _audioHandler = getIt<AudioHandler>();
                   final songRepository = getIt<PlaylistRepository>();
                    final song = await songRepository.fetchSelectedSong(title.value);
                     final mediaItem = MediaItem(
      id: song['id'] ?? '',
      album: song['album'] ?? '',
      title: song['title'] ?? '',
      extras: {'url': song['url']},
    );
    _audioHandler.addQueueItem(mediaItem);
                   
                },
                leading: title.value ==playlistTitles[index] ? Icon(Icons.pause_circle) :  Icon(Icons.play_circle),
                title: Text('${playlistTitles[index].replaceAll("&quot;", "")}'),
              );
            },
          );
        },
      ),
    );
  }
}

class AddRemoveSongButtons extends StatelessWidget {
  const AddRemoveSongButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: pageManager.add,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: pageManager.remove,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: pageManager.seek,
        );
      },
    );
  }
}

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RepeatButton(),
          PreviousSongButton(),
          PlayButton(),
          NextSongButton(),
          ShuffleButton(),
        ],
      ),
    );
  }
}

class RepeatButton extends StatelessWidget {
  const RepeatButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<RepeatState>(
      valueListenable: pageManager.repeatButtonNotifier,
      builder: (context, value, child) {
        Icon icon;
        switch (value) {
          case RepeatState.off:
            icon = Icon(Icons.repeat, color: Colors.grey);
            break;
          case RepeatState.repeatSong:
            icon = Icon(Icons.repeat_one);
            break;
          case RepeatState.repeatPlaylist:
            icon = Icon(Icons.repeat);
            break;
        }
        return IconButton(
          icon: icon,
          onPressed: pageManager.repeat,
        );
      },
    );
  }
}

class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: Icon(Icons.skip_previous),
          onPressed: (isFirst) ? null : pageManager.previous,
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: EdgeInsets.all(8.0),
              width: 32.0,
              height: 32.0,
              child: CircularProgressIndicator(),
            );
          case ButtonState.paused:
            return IconButton(
              icon: Icon(Icons.play_arrow),
              iconSize: 32.0,
              onPressed:() async { 
                final _audioHandler = getIt<AudioHandler>();
                bool check = await _audioHandler.queue.isEmpty;
                if(check){
                   addToQueue();
                   }
                pageManager.play();},
            );
          case ButtonState.playing:
            return IconButton(
              icon: Icon(Icons.pause),
              iconSize: 32.0,
              onPressed:
               pageManager.pause,
            );
        }
      },
    );
  }
}

class NextSongButton extends StatelessWidget {
  const NextSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: Icon(Icons.skip_next),
          onPressed: (isLast) ? null : pageManager.next,
        );
      },
    );
  }
}

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<PageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isShuffleModeEnabledNotifier,
      builder: (context, isEnabled, child) {
        return IconButton(
          icon: (isEnabled)
              ? Icon(Icons.shuffle)
              : Icon(Icons.shuffle, color: Colors.grey),
          onPressed: pageManager.shuffle,
        );
      },
    );
  }
}
