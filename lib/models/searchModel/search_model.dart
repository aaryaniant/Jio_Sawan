import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
	final List<Datum>? data;

	const SearchModel({this.data});

	@override
	String toString() => 'SearchModel(data: $data)';

	factory SearchModel.fromJson(Map<String, dynamic> json) {
		return _$SearchModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SearchModelToJson(this);

		SearchModel copyWith({
		List<Datum>? data,
	}) {
		return SearchModel(
			data: data ?? this.data,
		);
	}

	@override
	bool operator ==(dynamic other) {
		if (identical(other, this)) return true;
		if (other is! SearchModel) return false;
		return listEquals(other.data, data);
	}

	@override
	int get hashCode => data.hashCode;
}
