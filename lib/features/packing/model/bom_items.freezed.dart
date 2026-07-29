// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bom_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BomItems _$BomItemsFromJson(Map<String, dynamic> json) {
  return _BomItems.fromJson(json);
}

/// @nodoc
mixin _$BomItems {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation')
  String? get creation => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified')
  String? get modified => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_by')
  String? get modifiedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'docstatus')
  int? get docstatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'idx')
  int? get idx => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent')
  String? get parent => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentfield')
  String? get parentfield => throw _privateConstructorUsedError;
  @JsonKey(name: 'parenttype')
  String? get parenttype => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_code')
  String? get itemCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String? get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'operation')
  String? get operation => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_component_scanning')
  String? get customComponentScanning => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_package_qty')
  double? get customPackageQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_no_of_scan')
  double? get customNoOfScan => throw _privateConstructorUsedError;
  @JsonKey(name: 'do_not_explode')
  int? get doNotExplode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bom_no')
  String? get bomNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_warehouse')
  String? get sourceWarehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'allow_alternative_item')
  int? get allowAlternativeItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_stock_item')
  int? get isStockItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  double? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'uom')
  String? get uom => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_qty')
  double? get stockQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_uom')
  String? get stockUom => throw _privateConstructorUsedError;
  @JsonKey(name: 'conversion_factor')
  double? get conversionFactor => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate')
  double? get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_rate')
  double? get baseRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_amount')
  double? get baseAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_consumed_per_unit')
  double? get qtyConsumedPerUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_variants')
  int? get hasVariants => throw _privateConstructorUsedError;
  @JsonKey(name: 'include_item_in_manufacturing')
  int? get includeItemInManufacturing => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_item')
  String? get originalItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'sourced_by_supplier')
  int? get sourcedBySupplier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BomItemsCopyWith<BomItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BomItemsCopyWith<$Res> {
  factory $BomItemsCopyWith(BomItems value, $Res Function(BomItems) then) =
      _$BomItemsCopyWithImpl<$Res, BomItems>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'creation') String? creation,
      @JsonKey(name: 'modified') String? modified,
      @JsonKey(name: 'modified_by') String? modifiedBy,
      @JsonKey(name: 'docstatus') int? docstatus,
      @JsonKey(name: 'idx') int? idx,
      @JsonKey(name: 'parent') String? parent,
      @JsonKey(name: 'parentfield') String? parentfield,
      @JsonKey(name: 'parenttype') String? parenttype,
      @JsonKey(name: 'item_code') String? itemCode,
      @JsonKey(name: 'item_name') String? itemName,
      @JsonKey(name: 'operation') String? operation,
      @JsonKey(name: 'custom_component_scanning')
      String? customComponentScanning,
      @JsonKey(name: 'custom_package_qty') double? customPackageQty,
      @JsonKey(name: 'custom_no_of_scan') double? customNoOfScan,
      @JsonKey(name: 'do_not_explode') int? doNotExplode,
      @JsonKey(name: 'bom_no') String? bomNo,
      @JsonKey(name: 'source_warehouse') String? sourceWarehouse,
      @JsonKey(name: 'allow_alternative_item') int? allowAlternativeItem,
      @JsonKey(name: 'is_stock_item') int? isStockItem,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'qty') double? qty,
      @JsonKey(name: 'uom') String? uom,
      @JsonKey(name: 'stock_qty') double? stockQty,
      @JsonKey(name: 'stock_uom') String? stockUom,
      @JsonKey(name: 'conversion_factor') double? conversionFactor,
      @JsonKey(name: 'rate') double? rate,
      @JsonKey(name: 'base_rate') double? baseRate,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'base_amount') double? baseAmount,
      @JsonKey(name: 'qty_consumed_per_unit') double? qtyConsumedPerUnit,
      @JsonKey(name: 'has_variants') int? hasVariants,
      @JsonKey(name: 'include_item_in_manufacturing')
      int? includeItemInManufacturing,
      @JsonKey(name: 'original_item') String? originalItem,
      @JsonKey(name: 'sourced_by_supplier') int? sourcedBySupplier});
}

/// @nodoc
class _$BomItemsCopyWithImpl<$Res, $Val extends BomItems>
    implements $BomItemsCopyWith<$Res> {
  _$BomItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? creation = freezed,
    Object? modified = freezed,
    Object? modifiedBy = freezed,
    Object? docstatus = freezed,
    Object? idx = freezed,
    Object? parent = freezed,
    Object? parentfield = freezed,
    Object? parenttype = freezed,
    Object? itemCode = freezed,
    Object? itemName = freezed,
    Object? operation = freezed,
    Object? customComponentScanning = freezed,
    Object? customPackageQty = freezed,
    Object? customNoOfScan = freezed,
    Object? doNotExplode = freezed,
    Object? bomNo = freezed,
    Object? sourceWarehouse = freezed,
    Object? allowAlternativeItem = freezed,
    Object? isStockItem = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? qty = freezed,
    Object? uom = freezed,
    Object? stockQty = freezed,
    Object? stockUom = freezed,
    Object? conversionFactor = freezed,
    Object? rate = freezed,
    Object? baseRate = freezed,
    Object? amount = freezed,
    Object? baseAmount = freezed,
    Object? qtyConsumedPerUnit = freezed,
    Object? hasVariants = freezed,
    Object? includeItemInManufacturing = freezed,
    Object? originalItem = freezed,
    Object? sourcedBySupplier = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      creation: freezed == creation
          ? _value.creation
          : creation // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      docstatus: freezed == docstatus
          ? _value.docstatus
          : docstatus // ignore: cast_nullable_to_non_nullable
              as int?,
      idx: freezed == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      parentfield: freezed == parentfield
          ? _value.parentfield
          : parentfield // ignore: cast_nullable_to_non_nullable
              as String?,
      parenttype: freezed == parenttype
          ? _value.parenttype
          : parenttype // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCode: freezed == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      operation: freezed == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String?,
      customComponentScanning: freezed == customComponentScanning
          ? _value.customComponentScanning
          : customComponentScanning // ignore: cast_nullable_to_non_nullable
              as String?,
      customPackageQty: freezed == customPackageQty
          ? _value.customPackageQty
          : customPackageQty // ignore: cast_nullable_to_non_nullable
              as double?,
      customNoOfScan: freezed == customNoOfScan
          ? _value.customNoOfScan
          : customNoOfScan // ignore: cast_nullable_to_non_nullable
              as double?,
      doNotExplode: freezed == doNotExplode
          ? _value.doNotExplode
          : doNotExplode // ignore: cast_nullable_to_non_nullable
              as int?,
      bomNo: freezed == bomNo
          ? _value.bomNo
          : bomNo // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceWarehouse: freezed == sourceWarehouse
          ? _value.sourceWarehouse
          : sourceWarehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      allowAlternativeItem: freezed == allowAlternativeItem
          ? _value.allowAlternativeItem
          : allowAlternativeItem // ignore: cast_nullable_to_non_nullable
              as int?,
      isStockItem: freezed == isStockItem
          ? _value.isStockItem
          : isStockItem // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      stockQty: freezed == stockQty
          ? _value.stockQty
          : stockQty // ignore: cast_nullable_to_non_nullable
              as double?,
      stockUom: freezed == stockUom
          ? _value.stockUom
          : stockUom // ignore: cast_nullable_to_non_nullable
              as String?,
      conversionFactor: freezed == conversionFactor
          ? _value.conversionFactor
          : conversionFactor // ignore: cast_nullable_to_non_nullable
              as double?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      baseRate: freezed == baseRate
          ? _value.baseRate
          : baseRate // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      baseAmount: freezed == baseAmount
          ? _value.baseAmount
          : baseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      qtyConsumedPerUnit: freezed == qtyConsumedPerUnit
          ? _value.qtyConsumedPerUnit
          : qtyConsumedPerUnit // ignore: cast_nullable_to_non_nullable
              as double?,
      hasVariants: freezed == hasVariants
          ? _value.hasVariants
          : hasVariants // ignore: cast_nullable_to_non_nullable
              as int?,
      includeItemInManufacturing: freezed == includeItemInManufacturing
          ? _value.includeItemInManufacturing
          : includeItemInManufacturing // ignore: cast_nullable_to_non_nullable
              as int?,
      originalItem: freezed == originalItem
          ? _value.originalItem
          : originalItem // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcedBySupplier: freezed == sourcedBySupplier
          ? _value.sourcedBySupplier
          : sourcedBySupplier // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BomItemsImplCopyWith<$Res>
    implements $BomItemsCopyWith<$Res> {
  factory _$$BomItemsImplCopyWith(
          _$BomItemsImpl value, $Res Function(_$BomItemsImpl) then) =
      __$$BomItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'creation') String? creation,
      @JsonKey(name: 'modified') String? modified,
      @JsonKey(name: 'modified_by') String? modifiedBy,
      @JsonKey(name: 'docstatus') int? docstatus,
      @JsonKey(name: 'idx') int? idx,
      @JsonKey(name: 'parent') String? parent,
      @JsonKey(name: 'parentfield') String? parentfield,
      @JsonKey(name: 'parenttype') String? parenttype,
      @JsonKey(name: 'item_code') String? itemCode,
      @JsonKey(name: 'item_name') String? itemName,
      @JsonKey(name: 'operation') String? operation,
      @JsonKey(name: 'custom_component_scanning')
      String? customComponentScanning,
      @JsonKey(name: 'custom_package_qty') double? customPackageQty,
      @JsonKey(name: 'custom_no_of_scan') double? customNoOfScan,
      @JsonKey(name: 'do_not_explode') int? doNotExplode,
      @JsonKey(name: 'bom_no') String? bomNo,
      @JsonKey(name: 'source_warehouse') String? sourceWarehouse,
      @JsonKey(name: 'allow_alternative_item') int? allowAlternativeItem,
      @JsonKey(name: 'is_stock_item') int? isStockItem,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'image') String? image,
      @JsonKey(name: 'qty') double? qty,
      @JsonKey(name: 'uom') String? uom,
      @JsonKey(name: 'stock_qty') double? stockQty,
      @JsonKey(name: 'stock_uom') String? stockUom,
      @JsonKey(name: 'conversion_factor') double? conversionFactor,
      @JsonKey(name: 'rate') double? rate,
      @JsonKey(name: 'base_rate') double? baseRate,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'base_amount') double? baseAmount,
      @JsonKey(name: 'qty_consumed_per_unit') double? qtyConsumedPerUnit,
      @JsonKey(name: 'has_variants') int? hasVariants,
      @JsonKey(name: 'include_item_in_manufacturing')
      int? includeItemInManufacturing,
      @JsonKey(name: 'original_item') String? originalItem,
      @JsonKey(name: 'sourced_by_supplier') int? sourcedBySupplier});
}

/// @nodoc
class __$$BomItemsImplCopyWithImpl<$Res>
    extends _$BomItemsCopyWithImpl<$Res, _$BomItemsImpl>
    implements _$$BomItemsImplCopyWith<$Res> {
  __$$BomItemsImplCopyWithImpl(
      _$BomItemsImpl _value, $Res Function(_$BomItemsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? creation = freezed,
    Object? modified = freezed,
    Object? modifiedBy = freezed,
    Object? docstatus = freezed,
    Object? idx = freezed,
    Object? parent = freezed,
    Object? parentfield = freezed,
    Object? parenttype = freezed,
    Object? itemCode = freezed,
    Object? itemName = freezed,
    Object? operation = freezed,
    Object? customComponentScanning = freezed,
    Object? customPackageQty = freezed,
    Object? customNoOfScan = freezed,
    Object? doNotExplode = freezed,
    Object? bomNo = freezed,
    Object? sourceWarehouse = freezed,
    Object? allowAlternativeItem = freezed,
    Object? isStockItem = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? qty = freezed,
    Object? uom = freezed,
    Object? stockQty = freezed,
    Object? stockUom = freezed,
    Object? conversionFactor = freezed,
    Object? rate = freezed,
    Object? baseRate = freezed,
    Object? amount = freezed,
    Object? baseAmount = freezed,
    Object? qtyConsumedPerUnit = freezed,
    Object? hasVariants = freezed,
    Object? includeItemInManufacturing = freezed,
    Object? originalItem = freezed,
    Object? sourcedBySupplier = freezed,
  }) {
    return _then(_$BomItemsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      creation: freezed == creation
          ? _value.creation
          : creation // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      docstatus: freezed == docstatus
          ? _value.docstatus
          : docstatus // ignore: cast_nullable_to_non_nullable
              as int?,
      idx: freezed == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int?,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      parentfield: freezed == parentfield
          ? _value.parentfield
          : parentfield // ignore: cast_nullable_to_non_nullable
              as String?,
      parenttype: freezed == parenttype
          ? _value.parenttype
          : parenttype // ignore: cast_nullable_to_non_nullable
              as String?,
      itemCode: freezed == itemCode
          ? _value.itemCode
          : itemCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      operation: freezed == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as String?,
      customComponentScanning: freezed == customComponentScanning
          ? _value.customComponentScanning
          : customComponentScanning // ignore: cast_nullable_to_non_nullable
              as String?,
      customPackageQty: freezed == customPackageQty
          ? _value.customPackageQty
          : customPackageQty // ignore: cast_nullable_to_non_nullable
              as double?,
      customNoOfScan: freezed == customNoOfScan
          ? _value.customNoOfScan
          : customNoOfScan // ignore: cast_nullable_to_non_nullable
              as double?,
      doNotExplode: freezed == doNotExplode
          ? _value.doNotExplode
          : doNotExplode // ignore: cast_nullable_to_non_nullable
              as int?,
      bomNo: freezed == bomNo
          ? _value.bomNo
          : bomNo // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceWarehouse: freezed == sourceWarehouse
          ? _value.sourceWarehouse
          : sourceWarehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      allowAlternativeItem: freezed == allowAlternativeItem
          ? _value.allowAlternativeItem
          : allowAlternativeItem // ignore: cast_nullable_to_non_nullable
              as int?,
      isStockItem: freezed == isStockItem
          ? _value.isStockItem
          : isStockItem // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      stockQty: freezed == stockQty
          ? _value.stockQty
          : stockQty // ignore: cast_nullable_to_non_nullable
              as double?,
      stockUom: freezed == stockUom
          ? _value.stockUom
          : stockUom // ignore: cast_nullable_to_non_nullable
              as String?,
      conversionFactor: freezed == conversionFactor
          ? _value.conversionFactor
          : conversionFactor // ignore: cast_nullable_to_non_nullable
              as double?,
      rate: freezed == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      baseRate: freezed == baseRate
          ? _value.baseRate
          : baseRate // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      baseAmount: freezed == baseAmount
          ? _value.baseAmount
          : baseAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      qtyConsumedPerUnit: freezed == qtyConsumedPerUnit
          ? _value.qtyConsumedPerUnit
          : qtyConsumedPerUnit // ignore: cast_nullable_to_non_nullable
              as double?,
      hasVariants: freezed == hasVariants
          ? _value.hasVariants
          : hasVariants // ignore: cast_nullable_to_non_nullable
              as int?,
      includeItemInManufacturing: freezed == includeItemInManufacturing
          ? _value.includeItemInManufacturing
          : includeItemInManufacturing // ignore: cast_nullable_to_non_nullable
              as int?,
      originalItem: freezed == originalItem
          ? _value.originalItem
          : originalItem // ignore: cast_nullable_to_non_nullable
              as String?,
      sourcedBySupplier: freezed == sourcedBySupplier
          ? _value.sourcedBySupplier
          : sourcedBySupplier // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BomItemsImpl implements _BomItems {
  const _$BomItemsImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'owner') this.owner,
      @JsonKey(name: 'creation') this.creation,
      @JsonKey(name: 'modified') this.modified,
      @JsonKey(name: 'modified_by') this.modifiedBy,
      @JsonKey(name: 'docstatus') this.docstatus,
      @JsonKey(name: 'idx') this.idx,
      @JsonKey(name: 'parent') this.parent,
      @JsonKey(name: 'parentfield') this.parentfield,
      @JsonKey(name: 'parenttype') this.parenttype,
      @JsonKey(name: 'item_code') this.itemCode,
      @JsonKey(name: 'item_name') this.itemName,
      @JsonKey(name: 'operation') this.operation,
      @JsonKey(name: 'custom_component_scanning') this.customComponentScanning,
      @JsonKey(name: 'custom_package_qty') this.customPackageQty,
      @JsonKey(name: 'custom_no_of_scan') this.customNoOfScan,
      @JsonKey(name: 'do_not_explode') this.doNotExplode,
      @JsonKey(name: 'bom_no') this.bomNo,
      @JsonKey(name: 'source_warehouse') this.sourceWarehouse,
      @JsonKey(name: 'allow_alternative_item') this.allowAlternativeItem,
      @JsonKey(name: 'is_stock_item') this.isStockItem,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'qty') this.qty,
      @JsonKey(name: 'uom') this.uom,
      @JsonKey(name: 'stock_qty') this.stockQty,
      @JsonKey(name: 'stock_uom') this.stockUom,
      @JsonKey(name: 'conversion_factor') this.conversionFactor,
      @JsonKey(name: 'rate') this.rate,
      @JsonKey(name: 'base_rate') this.baseRate,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'base_amount') this.baseAmount,
      @JsonKey(name: 'qty_consumed_per_unit') this.qtyConsumedPerUnit,
      @JsonKey(name: 'has_variants') this.hasVariants,
      @JsonKey(name: 'include_item_in_manufacturing')
      this.includeItemInManufacturing,
      @JsonKey(name: 'original_item') this.originalItem,
      @JsonKey(name: 'sourced_by_supplier') this.sourcedBySupplier});

  factory _$BomItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BomItemsImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'owner')
  final String? owner;
  @override
  @JsonKey(name: 'creation')
  final String? creation;
  @override
  @JsonKey(name: 'modified')
  final String? modified;
  @override
  @JsonKey(name: 'modified_by')
  final String? modifiedBy;
  @override
  @JsonKey(name: 'docstatus')
  final int? docstatus;
  @override
  @JsonKey(name: 'idx')
  final int? idx;
  @override
  @JsonKey(name: 'parent')
  final String? parent;
  @override
  @JsonKey(name: 'parentfield')
  final String? parentfield;
  @override
  @JsonKey(name: 'parenttype')
  final String? parenttype;
  @override
  @JsonKey(name: 'item_code')
  final String? itemCode;
  @override
  @JsonKey(name: 'item_name')
  final String? itemName;
  @override
  @JsonKey(name: 'operation')
  final String? operation;
  @override
  @JsonKey(name: 'custom_component_scanning')
  final String? customComponentScanning;
  @override
  @JsonKey(name: 'custom_package_qty')
  final double? customPackageQty;
  @override
  @JsonKey(name: 'custom_no_of_scan')
  final double? customNoOfScan;
  @override
  @JsonKey(name: 'do_not_explode')
  final int? doNotExplode;
  @override
  @JsonKey(name: 'bom_no')
  final String? bomNo;
  @override
  @JsonKey(name: 'source_warehouse')
  final String? sourceWarehouse;
  @override
  @JsonKey(name: 'allow_alternative_item')
  final int? allowAlternativeItem;
  @override
  @JsonKey(name: 'is_stock_item')
  final int? isStockItem;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'image')
  final String? image;
  @override
  @JsonKey(name: 'qty')
  final double? qty;
  @override
  @JsonKey(name: 'uom')
  final String? uom;
  @override
  @JsonKey(name: 'stock_qty')
  final double? stockQty;
  @override
  @JsonKey(name: 'stock_uom')
  final String? stockUom;
  @override
  @JsonKey(name: 'conversion_factor')
  final double? conversionFactor;
  @override
  @JsonKey(name: 'rate')
  final double? rate;
  @override
  @JsonKey(name: 'base_rate')
  final double? baseRate;
  @override
  @JsonKey(name: 'amount')
  final double? amount;
  @override
  @JsonKey(name: 'base_amount')
  final double? baseAmount;
  @override
  @JsonKey(name: 'qty_consumed_per_unit')
  final double? qtyConsumedPerUnit;
  @override
  @JsonKey(name: 'has_variants')
  final int? hasVariants;
  @override
  @JsonKey(name: 'include_item_in_manufacturing')
  final int? includeItemInManufacturing;
  @override
  @JsonKey(name: 'original_item')
  final String? originalItem;
  @override
  @JsonKey(name: 'sourced_by_supplier')
  final int? sourcedBySupplier;

  @override
  String toString() {
    return 'BomItems(name: $name, owner: $owner, creation: $creation, modified: $modified, modifiedBy: $modifiedBy, docstatus: $docstatus, idx: $idx, parent: $parent, parentfield: $parentfield, parenttype: $parenttype, itemCode: $itemCode, itemName: $itemName, operation: $operation, customComponentScanning: $customComponentScanning, customPackageQty: $customPackageQty, customNoOfScan: $customNoOfScan, doNotExplode: $doNotExplode, bomNo: $bomNo, sourceWarehouse: $sourceWarehouse, allowAlternativeItem: $allowAlternativeItem, isStockItem: $isStockItem, description: $description, image: $image, qty: $qty, uom: $uom, stockQty: $stockQty, stockUom: $stockUom, conversionFactor: $conversionFactor, rate: $rate, baseRate: $baseRate, amount: $amount, baseAmount: $baseAmount, qtyConsumedPerUnit: $qtyConsumedPerUnit, hasVariants: $hasVariants, includeItemInManufacturing: $includeItemInManufacturing, originalItem: $originalItem, sourcedBySupplier: $sourcedBySupplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BomItemsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.creation, creation) ||
                other.creation == creation) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.docstatus, docstatus) ||
                other.docstatus == docstatus) &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.parentfield, parentfield) ||
                other.parentfield == parentfield) &&
            (identical(other.parenttype, parenttype) ||
                other.parenttype == parenttype) &&
            (identical(other.itemCode, itemCode) ||
                other.itemCode == itemCode) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(
                    other.customComponentScanning, customComponentScanning) ||
                other.customComponentScanning == customComponentScanning) &&
            (identical(other.customPackageQty, customPackageQty) ||
                other.customPackageQty == customPackageQty) &&
            (identical(other.customNoOfScan, customNoOfScan) ||
                other.customNoOfScan == customNoOfScan) &&
            (identical(other.doNotExplode, doNotExplode) ||
                other.doNotExplode == doNotExplode) &&
            (identical(other.bomNo, bomNo) || other.bomNo == bomNo) &&
            (identical(other.sourceWarehouse, sourceWarehouse) ||
                other.sourceWarehouse == sourceWarehouse) &&
            (identical(other.allowAlternativeItem, allowAlternativeItem) ||
                other.allowAlternativeItem == allowAlternativeItem) &&
            (identical(other.isStockItem, isStockItem) ||
                other.isStockItem == isStockItem) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.stockQty, stockQty) ||
                other.stockQty == stockQty) &&
            (identical(other.stockUom, stockUom) ||
                other.stockUom == stockUom) &&
            (identical(other.conversionFactor, conversionFactor) ||
                other.conversionFactor == conversionFactor) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.baseRate, baseRate) ||
                other.baseRate == baseRate) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.baseAmount, baseAmount) ||
                other.baseAmount == baseAmount) &&
            (identical(other.qtyConsumedPerUnit, qtyConsumedPerUnit) ||
                other.qtyConsumedPerUnit == qtyConsumedPerUnit) &&
            (identical(other.hasVariants, hasVariants) ||
                other.hasVariants == hasVariants) &&
            (identical(other.includeItemInManufacturing,
                    includeItemInManufacturing) ||
                other.includeItemInManufacturing ==
                    includeItemInManufacturing) &&
            (identical(other.originalItem, originalItem) ||
                other.originalItem == originalItem) &&
            (identical(other.sourcedBySupplier, sourcedBySupplier) ||
                other.sourcedBySupplier == sourcedBySupplier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        owner,
        creation,
        modified,
        modifiedBy,
        docstatus,
        idx,
        parent,
        parentfield,
        parenttype,
        itemCode,
        itemName,
        operation,
        customComponentScanning,
        customPackageQty,
        customNoOfScan,
        doNotExplode,
        bomNo,
        sourceWarehouse,
        allowAlternativeItem,
        isStockItem,
        description,
        image,
        qty,
        uom,
        stockQty,
        stockUom,
        conversionFactor,
        rate,
        baseRate,
        amount,
        baseAmount,
        qtyConsumedPerUnit,
        hasVariants,
        includeItemInManufacturing,
        originalItem,
        sourcedBySupplier
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BomItemsImplCopyWith<_$BomItemsImpl> get copyWith =>
      __$$BomItemsImplCopyWithImpl<_$BomItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BomItemsImplToJson(
      this,
    );
  }
}

abstract class _BomItems implements BomItems {
  const factory _BomItems(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'owner') final String? owner,
      @JsonKey(name: 'creation') final String? creation,
      @JsonKey(name: 'modified') final String? modified,
      @JsonKey(name: 'modified_by') final String? modifiedBy,
      @JsonKey(name: 'docstatus') final int? docstatus,
      @JsonKey(name: 'idx') final int? idx,
      @JsonKey(name: 'parent') final String? parent,
      @JsonKey(name: 'parentfield') final String? parentfield,
      @JsonKey(name: 'parenttype') final String? parenttype,
      @JsonKey(name: 'item_code') final String? itemCode,
      @JsonKey(name: 'item_name') final String? itemName,
      @JsonKey(name: 'operation') final String? operation,
      @JsonKey(name: 'custom_component_scanning')
      final String? customComponentScanning,
      @JsonKey(name: 'custom_package_qty') final double? customPackageQty,
      @JsonKey(name: 'custom_no_of_scan') final double? customNoOfScan,
      @JsonKey(name: 'do_not_explode') final int? doNotExplode,
      @JsonKey(name: 'bom_no') final String? bomNo,
      @JsonKey(name: 'source_warehouse') final String? sourceWarehouse,
      @JsonKey(name: 'allow_alternative_item') final int? allowAlternativeItem,
      @JsonKey(name: 'is_stock_item') final int? isStockItem,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'image') final String? image,
      @JsonKey(name: 'qty') final double? qty,
      @JsonKey(name: 'uom') final String? uom,
      @JsonKey(name: 'stock_qty') final double? stockQty,
      @JsonKey(name: 'stock_uom') final String? stockUom,
      @JsonKey(name: 'conversion_factor') final double? conversionFactor,
      @JsonKey(name: 'rate') final double? rate,
      @JsonKey(name: 'base_rate') final double? baseRate,
      @JsonKey(name: 'amount') final double? amount,
      @JsonKey(name: 'base_amount') final double? baseAmount,
      @JsonKey(name: 'qty_consumed_per_unit') final double? qtyConsumedPerUnit,
      @JsonKey(name: 'has_variants') final int? hasVariants,
      @JsonKey(name: 'include_item_in_manufacturing')
      final int? includeItemInManufacturing,
      @JsonKey(name: 'original_item') final String? originalItem,
      @JsonKey(name: 'sourced_by_supplier')
      final int? sourcedBySupplier}) = _$BomItemsImpl;

  factory _BomItems.fromJson(Map<String, dynamic> json) =
      _$BomItemsImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'owner')
  String? get owner;
  @override
  @JsonKey(name: 'creation')
  String? get creation;
  @override
  @JsonKey(name: 'modified')
  String? get modified;
  @override
  @JsonKey(name: 'modified_by')
  String? get modifiedBy;
  @override
  @JsonKey(name: 'docstatus')
  int? get docstatus;
  @override
  @JsonKey(name: 'idx')
  int? get idx;
  @override
  @JsonKey(name: 'parent')
  String? get parent;
  @override
  @JsonKey(name: 'parentfield')
  String? get parentfield;
  @override
  @JsonKey(name: 'parenttype')
  String? get parenttype;
  @override
  @JsonKey(name: 'item_code')
  String? get itemCode;
  @override
  @JsonKey(name: 'item_name')
  String? get itemName;
  @override
  @JsonKey(name: 'operation')
  String? get operation;
  @override
  @JsonKey(name: 'custom_component_scanning')
  String? get customComponentScanning;
  @override
  @JsonKey(name: 'custom_package_qty')
  double? get customPackageQty;
  @override
  @JsonKey(name: 'custom_no_of_scan')
  double? get customNoOfScan;
  @override
  @JsonKey(name: 'do_not_explode')
  int? get doNotExplode;
  @override
  @JsonKey(name: 'bom_no')
  String? get bomNo;
  @override
  @JsonKey(name: 'source_warehouse')
  String? get sourceWarehouse;
  @override
  @JsonKey(name: 'allow_alternative_item')
  int? get allowAlternativeItem;
  @override
  @JsonKey(name: 'is_stock_item')
  int? get isStockItem;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'image')
  String? get image;
  @override
  @JsonKey(name: 'qty')
  double? get qty;
  @override
  @JsonKey(name: 'uom')
  String? get uom;
  @override
  @JsonKey(name: 'stock_qty')
  double? get stockQty;
  @override
  @JsonKey(name: 'stock_uom')
  String? get stockUom;
  @override
  @JsonKey(name: 'conversion_factor')
  double? get conversionFactor;
  @override
  @JsonKey(name: 'rate')
  double? get rate;
  @override
  @JsonKey(name: 'base_rate')
  double? get baseRate;
  @override
  @JsonKey(name: 'amount')
  double? get amount;
  @override
  @JsonKey(name: 'base_amount')
  double? get baseAmount;
  @override
  @JsonKey(name: 'qty_consumed_per_unit')
  double? get qtyConsumedPerUnit;
  @override
  @JsonKey(name: 'has_variants')
  int? get hasVariants;
  @override
  @JsonKey(name: 'include_item_in_manufacturing')
  int? get includeItemInManufacturing;
  @override
  @JsonKey(name: 'original_item')
  String? get originalItem;
  @override
  @JsonKey(name: 'sourced_by_supplier')
  int? get sourcedBySupplier;
  @override
  @JsonKey(ignore: true)
  _$$BomItemsImplCopyWith<_$BomItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
