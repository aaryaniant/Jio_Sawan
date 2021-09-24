import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'weekly_top_model.g.dart';

@JsonSerializable()
class WeeklyTopModel {
	final String? id;
	final String? title;
	final String? subtitle;
	@JsonKey(name: 'header_desc') 
	final String? headerDesc;
	final String? type;
	@JsonKey(name: 'perma_url') 
	final String? permaUrl;
	final String? image;
	final String? language;
	final String? year;
	@JsonKey(name: 'play_count') 
	final String? playCount;
	@JsonKey(name: 'explicit_content') 
	final String? explicitContent;
	@JsonKey(name: 'list_count') 
	final String? listCount;
	@JsonKey(name: 'list_type') 
	final String? listType;
	final List<Datum>? data;

	const WeeklyTopModel({
		this.id, 
		this.title, 
		this.subtitle, 
		this.headerDesc, 
		this.type, 
		this.permaUrl, 
		this.image, 
		this.language, 
		this.year, 
		this.playCount, 
		this.explicitContent, 
		this.listCount, 
		this.listType, 
		this.data, 
	});

	@override
	String toString() {
		return 'WeeklyTopModel(id: $id, title: $title, subtitle: $subtitle, headerDesc: $headerDesc, type: $type, permaUrl: $permaUrl, image: $image, language: $language, year: $year, playCount: $playCount, explicitContent: $explicitContent, listCount: $listCount, listType: $listType, data: $data)';
	}

	factory WeeklyTopModel.fromJson(Map<String, dynamic> json) {
		return _$WeeklyTopModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$WeeklyTopModelToJson(this);

		WeeklyTopModel copyWith({
		String? id,
		String? title,
		String? subtitle,
		String? headerDesc,
		String? type,
		String? permaUrl,
		String? image,
		String? language,
		String? year,
		String? playCount,
		String? explicitContent,
		String? listCount,
		String? listType,
		List<Datum>? data,
	}) {
		return WeeklyTopModel(
			id: id ?? this.id,
			title: title ?? this.title,
			subtitle: subtitle ?? this.subtitle,
			headerDesc: headerDesc ?? this.headerDesc,
			type: type ?? this.type,
			permaUrl: permaUrl ?? this.permaUrl,
			image: image ?? this.image,
			language: language ?? this.language,
			year: year ?? this.year,
			playCount: playCount ?? this.playCount,
			explicitContent: explicitContent ?? this.explicitContent,
			listCount: listCount ?? this.listCount,
			listType: listType ?? this.listType,
			data: data ?? this.data,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		return other is WeeklyTopModel && 
				listEquals(other.data, data) &&
				other.id == id &&
				other.title == title &&
				other.subtitle == subtitle &&
				other.headerDesc == headerDesc &&
				other.type == type &&
				other.permaUrl == permaUrl &&
				other.image == image &&
				other.language == language &&
				other.year == year &&
				other.playCount == playCount &&
				other.explicitContent == explicitContent &&
				other.listCount == listCount &&
				other.listType == listType;
	}

	@override
	int get hashCode =>
			id.hashCode ^
			title.hashCode ^
			subtitle.hashCode ^
			headerDesc.hashCode ^
			type.hashCode ^
			permaUrl.hashCode ^
			image.hashCode ^
			language.hashCode ^
			year.hashCode ^
			playCount.hashCode ^
			explicitContent.hashCode ^
			listCount.hashCode ^
			listType.hashCode ^
			data.hashCode;
}
