import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_process.freezed.dart';
part 'select_process.g.dart';

@freezed
class SelectProcess with _$SelectProcess {
  const factory SelectProcess({
    @JsonKey(name: 'name') String? processName,
      }) = _SelectProcess;

  factory SelectProcess.fromJson(Map<String, dynamic> json) =>
      _$SelectProcessFromJson(json);
}
