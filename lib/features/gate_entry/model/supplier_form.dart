
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_form.freezed.dart';
part 'supplier_form.g.dart';

@freezed
class SupplierForm with _$SupplierForm {
  const factory SupplierForm({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'supplier_group') String? supplierGruop,
  }) = _SupplierForm;
factory SupplierForm.fromJson(Map<String, dynamic> json) => _$SupplierFormFromJson(json);
}