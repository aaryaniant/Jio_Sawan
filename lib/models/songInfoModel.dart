class SongInfoModel {
  String ?songId;
  String ?songName;
  String ?albumId;
  String ?albumName;
  String ?year;
  String? songReleaseDate;
  String ?songDuration;
  String ?songPlayCount;
  String ?songLanguage;
  String ?songHasLyrics;
  String ?songArtist;
  String ?songImage;
  String ?songLink;
  String ?albumLink;
  String ?songLabel;
  String ?copyright;
  List<dynamic> ?downloadLinks;

  SongInfoModel(
      {this.songId,
      this.songName,
      this.albumId,
      this.albumName,
      this.year,
      this.songReleaseDate,
      this.songDuration,
      this.songPlayCount,
      this.songLanguage,
      this.songHasLyrics,
      this.songArtist,
      this.songImage,
      this.songLink,
      this.albumLink,
      this.songLabel,
      this.copyright,
      this.downloadLinks});

  SongInfoModel.fromJson(Map<String, dynamic> json) {
    songId = json['song_id'];
    songName = json['song_name'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    year = json['year'];
    songReleaseDate = json['song_release_date'];
    songDuration = json['song_duration'];
    songPlayCount = json['song_play_count'].toString();
    songLanguage = json['song_language'];
    songHasLyrics = json['song_has_lyrics'];
    songArtist = json['song_artist'];
    songImage = json['song_image'];
    songLink = json['song_link'];
    albumLink = json['album_link'];
    songLabel = json['song_label'];
    copyright = json['copyright'];
    downloadLinks = json['download_links'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['song_id'] = this.songId;
    data['song_name'] = this.songName;
    data['album_id'] = this.albumId;
    data['album_name'] = this.albumName;
    data['year'] = this.year;
    data['song_release_date'] = this.songReleaseDate;
    data['song_duration'] = this.songDuration;
    data['song_play_count'] = this.songPlayCount;
    data['song_language'] = this.songLanguage;
    data['song_has_lyrics'] = this.songHasLyrics;
    data['song_artist'] = this.songArtist;
    data['song_image'] = this.songImage;
    data['song_link'] = this.songLink;
    data['album_link'] = this.albumLink;
    data['song_label'] = this.songLabel;
    data['copyright'] = this.copyright;
    data['download_links'] = this.downloadLinks;
    return data;
  }
}
