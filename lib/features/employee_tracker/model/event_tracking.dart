

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_tracking.freezed.dart';
part 'event_tracking.g.dart';

@freezed
class EventTracking with _$EventTracking {
  const factory EventTracking({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'idx') int? idx,
    @JsonKey(name: 'actual_date_time') String? actualDateTime,
    @JsonKey(name: 'activity') String? activity,
    @JsonKey(name: 'location') String? location,
  }) = _EventTracking;
factory EventTracking.fromJson(Map<String, dynamic> json) => _$EventTrackingFromJson(json);
}