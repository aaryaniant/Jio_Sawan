import 'package:music_app/models/musicModel/datum.dart';

import '../../../main.dart';

abstract class PlaylistRepository {
  Future<List<Map<String, String>>> fetchInitialPlaylist();
  Future<Map<String, String>> fetchAnotherSong();
    Future<Map<String, String>> fetchSelectedSong(title);
}

class DemoPlaylist extends PlaylistRepository {
  @override
  Future<List<Map<String, String>>> fetchInitialPlaylist(
      {int length = 3}) async {
    return store.state.weeklyTopModel!.data!.map((e) {
      int index = store.state.weeklyTopModel!.data!.indexOf(e);
      return {
      'id':  e.id.toString(), //_songIndex.toString().padLeft(3, '0'),
      'title': '${e.title}',
      'album': '${e.shershaah}',
      'url':
          store.state.playlistSongsUrls![index].toString(),
    };
    }).toList();
  }

  @override
  Future<Map<String, String>> fetchAnotherSong() async {
    return _nextSong();
  }

    @override
  Future<Map<String, String>> fetchSelectedSong(title) async {
    return _playSelectedSong(title);
  }


  var _songIndex = 0;
  static const _maxSongNumber = 16;

  Map<String, String> _nextSong() {
    _songIndex = (_songIndex ) + 1;
    // _songIndex = (_songIndex % _maxSongNumber) + 1;

    Datum item = store.state.weeklyTopModel!.data![_songIndex];
    return {
      'id': _songIndex.toString().padLeft(3, '0'),
      'title': '${item.title}',
      'album': '${item.shershaah}',
      'url':
         store.state.playlistSongsUrls![_songIndex].toString(),
    };
  }

  //selectedSong
    Map<String, String> _playSelectedSong(title) {
    _songIndex = (_songIndex ) + 1;
    // _songIndex = (_songIndex % _maxSongNumber) + 1;

    Datum item = store.state.weeklyTopModel!.data![_songIndex];
    if(title ==item.title){
    return {
      'id': _songIndex.toString().padLeft(3, '0'),
      'title': '${item.title}',
      'album': '${item.shershaah}',
      'url':
         store.state.playlistSongsUrls![_songIndex].toString(),
    };
    }
    else{
      return {
      // 'id': _songIndex.toString().padLeft(3, '0'),
      // 'title': '${item.title}',
      // 'album': '${item.shershaah}',
      // 'url':
      //    store.state.playlistSongsUrls![_songIndex].toString(),
    };
    }
  }
}
