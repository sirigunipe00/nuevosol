import 'package:freezed_annotation/freezed_annotation.dart';

part 'operator.freezed.dart';
part 'operator.g.dart';

@freezed
class Operator with _$Operator {
  const factory Operator({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'operator_name') String? operatorName,
    @JsonKey(name: 'operator_username') String? operatorUserName,
  }) = _Operator;

  factory Operator.fromJson(Map<String, dynamic> json) =>
      _$OperatorFromJson(json);
}
