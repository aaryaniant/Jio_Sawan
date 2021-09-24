import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	final String? id;
	final String? title;
	@JsonKey(name: 'Shershaah') 
	final String? shershaah;
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

	const Datum({
		this.id, 
		this.title, 
		this.shershaah, 
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
	});

	@override
	String toString() {
		return 'Datum(id: $id, title: $title, shershaah: $shershaah, subtitle: $subtitle, headerDesc: $headerDesc, type: $type, permaUrl: $permaUrl, image: $image, language: $language, year: $year, playCount: $playCount, explicitContent: $explicitContent, listCount: $listCount, listType: $listType)';
	}

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);

		Datum copyWith({
		String? id,
		String? title,
		String? shershaah,
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
	}) {
		return Datum(
			id: id ?? this.id,
			title: title ?? this.title,
			shershaah: shershaah ?? this.shershaah,
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
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		return other is Datum && 
				other.id == id &&
				other.title == title &&
				other.shershaah == shershaah &&
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
			shershaah.hashCode ^
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
			listType.hashCode;
}
