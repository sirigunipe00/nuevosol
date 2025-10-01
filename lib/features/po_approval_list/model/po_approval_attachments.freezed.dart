// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'po_approval_attachments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoApprovalAttachments _$PoApprovalAttachmentsFromJson(
    Map<String, dynamic> json) {
  return _PoApprovalAttachments.fromJson(json);
}

/// @nodoc
mixin _$PoApprovalAttachments {
  @JsonKey(name: 'file_name', defaultValue: '')
  String? get fileName => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_url', defaultValue: '')
  String? get fileUrl => throw _privateConstructorUsedError;

  /// Serializes this PoApprovalAttachments to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoApprovalAttachments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoApprovalAttachmentsCopyWith<PoApprovalAttachments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoApprovalAttachmentsCopyWith<$Res> {
  factory $PoApprovalAttachmentsCopyWith(PoApprovalAttachments value,
          $Res Function(PoApprovalAttachments) then) =
      _$PoApprovalAttachmentsCopyWithImpl<$Res, PoApprovalAttachments>;
  @useResult
  $Res call(
      {@JsonKey(name: 'file_name', defaultValue: '') String? fileName,
      @JsonKey(name: 'file_url', defaultValue: '') String? fileUrl});
}

/// @nodoc
class _$PoApprovalAttachmentsCopyWithImpl<$Res,
        $Val extends PoApprovalAttachments>
    implements $PoApprovalAttachmentsCopyWith<$Res> {
  _$PoApprovalAttachmentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoApprovalAttachments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileUrl = freezed,
  }) {
    return _then(_value.copyWith(
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoApprovalAttachmentsImplCopyWith<$Res>
    implements $PoApprovalAttachmentsCopyWith<$Res> {
  factory _$$PoApprovalAttachmentsImplCopyWith(
          _$PoApprovalAttachmentsImpl value,
          $Res Function(_$PoApprovalAttachmentsImpl) then) =
      __$$PoApprovalAttachmentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'file_name', defaultValue: '') String? fileName,
      @JsonKey(name: 'file_url', defaultValue: '') String? fileUrl});
}

/// @nodoc
class __$$PoApprovalAttachmentsImplCopyWithImpl<$Res>
    extends _$PoApprovalAttachmentsCopyWithImpl<$Res,
        _$PoApprovalAttachmentsImpl>
    implements _$$PoApprovalAttachmentsImplCopyWith<$Res> {
  __$$PoApprovalAttachmentsImplCopyWithImpl(_$PoApprovalAttachmentsImpl _value,
      $Res Function(_$PoApprovalAttachmentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoApprovalAttachments
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = freezed,
    Object? fileUrl = freezed,
  }) {
    return _then(_$PoApprovalAttachmentsImpl(
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileUrl: freezed == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoApprovalAttachmentsImpl implements _PoApprovalAttachments {
  const _$PoApprovalAttachmentsImpl(
      {@JsonKey(name: 'file_name', defaultValue: '') this.fileName,
      @JsonKey(name: 'file_url', defaultValue: '') this.fileUrl});

  factory _$PoApprovalAttachmentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoApprovalAttachmentsImplFromJson(json);

  @override
  @JsonKey(name: 'file_name', defaultValue: '')
  final String? fileName;
  @override
  @JsonKey(name: 'file_url', defaultValue: '')
  final String? fileUrl;

  @override
  String toString() {
    return 'PoApprovalAttachments(fileName: $fileName, fileUrl: $fileUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoApprovalAttachmentsImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fileName, fileUrl);

  /// Create a copy of PoApprovalAttachments
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoApprovalAttachmentsImplCopyWith<_$PoApprovalAttachmentsImpl>
      get copyWith => __$$PoApprovalAttachmentsImplCopyWithImpl<
          _$PoApprovalAttachmentsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoApprovalAttachmentsImplToJson(
      this,
    );
  }
}

abstract class _PoApprovalAttachments implements PoApprovalAttachments {
  const factory _PoApprovalAttachments(
          {@JsonKey(name: 'file_name', defaultValue: '') final String? fileName,
          @JsonKey(name: 'file_url', defaultValue: '') final String? fileUrl}) =
      _$PoApprovalAttachmentsImpl;

  factory _PoApprovalAttachments.fromJson(Map<String, dynamic> json) =
      _$PoApprovalAttachmentsImpl.fromJson;

  @override
  @JsonKey(name: 'file_name', defaultValue: '')
  String? get fileName;
  @override
  @JsonKey(name: 'file_url', defaultValue: '')
  String? get fileUrl;

  /// Create a copy of PoApprovalAttachments
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoApprovalAttachmentsImplCopyWith<_$PoApprovalAttachmentsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
