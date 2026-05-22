import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_list.freezed.dart';
part 'location_list.g.dart';

@freezed
class LocationList with _$LocationList {
  const factory LocationList({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'location_name') String? location

  }) = _LocationList;
factory LocationList.fromJson(Map<String, dynamic> json) => _$LocationListFromJson(json);
}