import 'package:flutter/material.dart';
import 'package:music_app/models/musicDailyModel/daily_top_model.dart';
import 'package:music_app/models/musicModel/weekly_top_model.dart';
import 'package:music_app/models/songInfoModel.dart';

@immutable
class AppState {
  final SongInfoModel? songInfoModel;
  final WeeklyTopModel? weeklyTopModel;
  final DailyTopModel? dailyTopModel;

  AppState({
    @required this.songInfoModel,
    @required this.weeklyTopModel,
    @required this.dailyTopModel,
  });

  factory AppState.initial() => AppState(
        songInfoModel: SongInfoModel.fromJson({}),
        weeklyTopModel: WeeklyTopModel.fromJson({}),
        dailyTopModel: DailyTopModel.fromJson({}),
        //  loader: Loader(showLoader: false),
      );

  AppState copyWith({context}) {
    return AppState(
      // loader: loader ?? this.loader ?? Loader(showLoader: false),
      songInfoModel: songInfoModel ?? this.songInfoModel,
      weeklyTopModel: weeklyTopModel ?? this.weeklyTopModel,
      dailyTopModel: dailyTopModel ?? this.dailyTopModel,
    );
  }
}
