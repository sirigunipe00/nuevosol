import 'package:freezed_annotation/freezed_annotation.dart';
part 'machine_no.freezed.dart';
part 'machine_no.g.dart';
@freezed
class MachineNo with _$MachineNo {
  const factory MachineNo({  
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation') String? creation,
    @JsonKey(name: 'modified') String? modified,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docstatus,
    
    }) = _MachineNo;

  factory MachineNo.fromJson(Map<String, dynamic> json) =>
      _$MachineNoFromJson(json);
}