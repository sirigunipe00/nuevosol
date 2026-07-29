import 'package:freezed_annotation/freezed_annotation.dart';

part 'bom.freezed.dart';
part 'bom.g.dart';

@freezed
class Bom with _$Bom {
  const factory Bom({
    @JsonKey(name: 'name') String? bomName,
    @JsonKey(name: 'quantity') double? bomqty,
     }) = _Bom;

  factory Bom.fromJson(Map<String, dynamic> json) =>
      _$BomFromJson(json);
}
