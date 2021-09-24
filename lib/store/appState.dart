import 'package:flutter/material.dart';
import 'package:music_app/models/musicDailyModel/daily_top_model.dart';
import 'package:music_app/models/musicModel/weekly_top_model.dart';
import 'package:music_app/models/songInfoModel.dart';

@immutable
class AppState {
  final SongInfoModel? songInfoModel;
  final WeeklyTopModel? weeklyTopModel;
  final DailyTopModel? dailyTopModel;
  final List? playlistSongsUrls;
  AppState({
    @required this.songInfoModel,
    @required this.weeklyTopModel,
    @required this.dailyTopModel,
    @required this.playlistSongsUrls
  });

  factory AppState.initial() => AppState(
        songInfoModel: SongInfoModel.fromJson({}),
        weeklyTopModel: WeeklyTopModel.fromJson({}),
        dailyTopModel: DailyTopModel.fromJson({}),
        playlistSongsUrls: []
        //  loader: Loader(showLoader: false),
      );

  AppState copyWith({context}) {
    return AppState(
      // loader: loader ?? this.loader ?? Loader(showLoader: false),
      songInfoModel: songInfoModel ?? this.songInfoModel,
      weeklyTopModel: weeklyTopModel ?? this.weeklyTopModel,
      dailyTopModel: dailyTopModel ?? this.dailyTopModel,
      playlistSongsUrls:playlistSongsUrls??this.playlistSongsUrls
    );
  }
}
