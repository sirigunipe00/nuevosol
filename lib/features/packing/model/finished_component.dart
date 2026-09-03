import 'package:freezed_annotation/freezed_annotation.dart';


part 'finished_component.freezed.dart';
part 'finished_component.g.dart';

@freezed
class FinishedComponent with _$FinishedComponent {
  const factory FinishedComponent({
    @JsonKey(name: 'name') String? componentName,
    @JsonKey(name: 'default_bom') String? defaultBom,
    @JsonKey(name: 'quality_inspection_template') String? qualityInspectionTemplate,
     }) = _FinishedComponent;
factory FinishedComponent.fromJson(Map<String, dynamic> json) =>
      _$FinishedComponentFromJson(json);
}