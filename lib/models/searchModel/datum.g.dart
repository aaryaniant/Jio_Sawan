// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      songId: json['song_id'] as String?,
      songName: json['song_name'] as String?,
      albumId: json['album_id'] as String?,
      albumName: json['album_name'] as String?,
      year: json['year'] as String?,
      songReleaseDate: json['song_release_date'],
      songDuration: json['song_duration'] as String?,
      songPlayCount: json['song_play_count'] as String?,
      songLanguage: json['song_language'] as String?,
      songHasLyrics: json['song_has_lyrics'] as String?,
      songArtist: json['song_artist'] as String?,
      songImage: json['song_image'] as String?,
      songLink: json['song_link'] as String?,
      albumLink: json['album_link'] as String?,
      songLabel: json['song_label'] as String?,
      copyright: json['copyright'] as String?,
      downloadLinks: (json['download_links'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'song_id': instance.songId,
      'song_name': instance.songName,
      'album_id': instance.albumId,
      'album_name': instance.albumName,
      'year': instance.year,
      'song_release_date': instance.songReleaseDate,
      'song_duration': instance.songDuration,
      'song_play_count': instance.songPlayCount,
      'song_language': instance.songLanguage,
      'song_has_lyrics': instance.songHasLyrics,
      'song_artist': instance.songArtist,
      'song_image': instance.songImage,
      'song_link': instance.songLink,
      'album_link': instance.albumLink,
      'song_label': instance.songLabel,
      'copyright': instance.copyright,
      'download_links': instance.downloadLinks,
    };
