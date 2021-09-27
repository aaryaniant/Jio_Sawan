import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	@JsonKey(name: 'song_id') 
	final String? songId;
	@JsonKey(name: 'song_name') 
	final String? songName;
	@JsonKey(name: 'album_id') 
	final String? albumId;
	@JsonKey(name: 'album_name') 
	final String? albumName;
	final String? year;
	@JsonKey(name: 'song_release_date') 
	final dynamic songReleaseDate;
	@JsonKey(name: 'song_duration') 
	final String? songDuration;
	@JsonKey(name: 'song_play_count') 
	final String? songPlayCount;
	@JsonKey(name: 'song_language') 
	final String? songLanguage;
	@JsonKey(name: 'song_has_lyrics') 
	final String? songHasLyrics;
	@JsonKey(name: 'song_artist') 
	final String? songArtist;
	@JsonKey(name: 'song_image') 
	final String? songImage;
	@JsonKey(name: 'song_link') 
	final String? songLink;
	@JsonKey(name: 'album_link') 
	final String? albumLink;
	@JsonKey(name: 'song_label') 
	final String? songLabel;
	final String? copyright;
	@JsonKey(name: 'download_links') 
	final List<String>? downloadLinks;

	const Datum({
		this.songId, 
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
		this.downloadLinks, 
	});

	@override
	String toString() {
		return 'Datum(songId: $songId, songName: $songName, albumId: $albumId, albumName: $albumName, year: $year, songReleaseDate: $songReleaseDate, songDuration: $songDuration, songPlayCount: $songPlayCount, songLanguage: $songLanguage, songHasLyrics: $songHasLyrics, songArtist: $songArtist, songImage: $songImage, songLink: $songLink, albumLink: $albumLink, songLabel: $songLabel, copyright: $copyright, downloadLinks: $downloadLinks)';
	}

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);

		Datum copyWith({
		String? songId,
		String? songName,
		String? albumId,
		String? albumName,
		String? year,
		dynamic songReleaseDate,
		String? songDuration,
		String? songPlayCount,
		String? songLanguage,
		String? songHasLyrics,
		String? songArtist,
		String? songImage,
		String? songLink,
		String? albumLink,
		String? songLabel,
		String? copyright,
		List<String>? downloadLinks,
	}) {
		return Datum(
			songId: songId ?? this.songId,
			songName: songName ?? this.songName,
			albumId: albumId ?? this.albumId,
			albumName: albumName ?? this.albumName,
			year: year ?? this.year,
			songReleaseDate: songReleaseDate ?? this.songReleaseDate,
			songDuration: songDuration ?? this.songDuration,
			songPlayCount: songPlayCount ?? this.songPlayCount,
			songLanguage: songLanguage ?? this.songLanguage,
			songHasLyrics: songHasLyrics ?? this.songHasLyrics,
			songArtist: songArtist ?? this.songArtist,
			songImage: songImage ?? this.songImage,
			songLink: songLink ?? this.songLink,
			albumLink: albumLink ?? this.albumLink,
			songLabel: songLabel ?? this.songLabel,
			copyright: copyright ?? this.copyright,
			downloadLinks: downloadLinks ?? this.downloadLinks,
		);
	}

	@override
	bool operator ==(dynamic other) {
		if (identical(other, this)) return true;
		if (other is! Datum) return false;
		return listEquals(other.downloadLinks, downloadLinks) &&
				other.songId == songId &&
				other.songName == songName &&
				other.albumId == albumId &&
				other.albumName == albumName &&
				other.year == year &&
				other.songReleaseDate == songReleaseDate &&
				other.songDuration == songDuration &&
				other.songPlayCount == songPlayCount &&
				other.songLanguage == songLanguage &&
				other.songHasLyrics == songHasLyrics &&
				other.songArtist == songArtist &&
				other.songImage == songImage &&
				other.songLink == songLink &&
				other.albumLink == albumLink &&
				other.songLabel == songLabel &&
				other.copyright == copyright;
	}

	@override
	int get hashCode =>
			songId.hashCode ^
			songName.hashCode ^
			albumId.hashCode ^
			albumName.hashCode ^
			year.hashCode ^
			songReleaseDate.hashCode ^
			songDuration.hashCode ^
			songPlayCount.hashCode ^
			songLanguage.hashCode ^
			songHasLyrics.hashCode ^
			songArtist.hashCode ^
			songImage.hashCode ^
			songLink.hashCode ^
			albumLink.hashCode ^
			songLabel.hashCode ^
			copyright.hashCode ^
			downloadLinks.hashCode;
}
