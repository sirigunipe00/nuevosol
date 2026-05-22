


import 'package:freezed_annotation/freezed_annotation.dart';

part 'reason_exit_type.freezed.dart';
part 'reason_exit_type.g.dart';

@freezed
class ReasonExitType with _$ReasonExitType {
  const factory ReasonExitType({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'reason_of_gate_exit_types') String? reason
  }) = _ReasonExitType;
factory ReasonExitType.fromJson(Map<String, dynamic> json) => _$ReasonExitTypeFromJson(json);
}