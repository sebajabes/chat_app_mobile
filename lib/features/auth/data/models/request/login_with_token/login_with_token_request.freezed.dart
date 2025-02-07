// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_with_token_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginWithTokenRequest _$LoginWithTokenRequestFromJson(
    Map<String, dynamic> json) {
  return _LoginWithTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginWithTokenRequest {
  String get token => throw _privateConstructorUsedError;

  /// Serializes this LoginWithTokenRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginWithTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginWithTokenRequestCopyWith<LoginWithTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginWithTokenRequestCopyWith<$Res> {
  factory $LoginWithTokenRequestCopyWith(LoginWithTokenRequest value,
          $Res Function(LoginWithTokenRequest) then) =
      _$LoginWithTokenRequestCopyWithImpl<$Res, LoginWithTokenRequest>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$LoginWithTokenRequestCopyWithImpl<$Res,
        $Val extends LoginWithTokenRequest>
    implements $LoginWithTokenRequestCopyWith<$Res> {
  _$LoginWithTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginWithTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginWithTokenRequestImplCopyWith<$Res>
    implements $LoginWithTokenRequestCopyWith<$Res> {
  factory _$$LoginWithTokenRequestImplCopyWith(
          _$LoginWithTokenRequestImpl value,
          $Res Function(_$LoginWithTokenRequestImpl) then) =
      __$$LoginWithTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$LoginWithTokenRequestImplCopyWithImpl<$Res>
    extends _$LoginWithTokenRequestCopyWithImpl<$Res,
        _$LoginWithTokenRequestImpl>
    implements _$$LoginWithTokenRequestImplCopyWith<$Res> {
  __$$LoginWithTokenRequestImplCopyWithImpl(_$LoginWithTokenRequestImpl _value,
      $Res Function(_$LoginWithTokenRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginWithTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$LoginWithTokenRequestImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginWithTokenRequestImpl implements _LoginWithTokenRequest {
  _$LoginWithTokenRequestImpl({required this.token});

  factory _$LoginWithTokenRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginWithTokenRequestImplFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'LoginWithTokenRequest(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithTokenRequestImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  /// Create a copy of LoginWithTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithTokenRequestImplCopyWith<_$LoginWithTokenRequestImpl>
      get copyWith => __$$LoginWithTokenRequestImplCopyWithImpl<
          _$LoginWithTokenRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginWithTokenRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginWithTokenRequest implements LoginWithTokenRequest {
  factory _LoginWithTokenRequest({required final String token}) =
      _$LoginWithTokenRequestImpl;

  factory _LoginWithTokenRequest.fromJson(Map<String, dynamic> json) =
      _$LoginWithTokenRequestImpl.fromJson;

  @override
  String get token;

  /// Create a copy of LoginWithTokenRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginWithTokenRequestImplCopyWith<_$LoginWithTokenRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
