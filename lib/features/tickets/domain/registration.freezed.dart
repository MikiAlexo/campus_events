// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Registration {

 String get id; String get userId; String get eventId; DateTime get registeredAt; RegistrationStatus get status;
/// Create a copy of Registration
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationCopyWith<Registration> get copyWith => _$RegistrationCopyWithImpl<Registration>(this as Registration, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Registration;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Registration&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.eventId, _this.eventId) || other.eventId == _this.eventId)&&(identical(other.registeredAt, _this.registeredAt) || other.registeredAt == _this.registeredAt)&&(identical(other.status, _this.status) || other.status == _this.status));
}


@override
int get hashCode {
  final _this = this as Registration;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.eventId,_this.registeredAt,_this.status);
}

@override
String toString() {
  final _this = this as Registration;
  return 'Registration(id: ${_this.id}, userId: ${_this.userId}, eventId: ${_this.eventId}, registeredAt: ${_this.registeredAt}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $RegistrationCopyWith<$Res>  {
  factory $RegistrationCopyWith(Registration value, $Res Function(Registration) _then) = _$RegistrationCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String eventId, DateTime registeredAt, RegistrationStatus status
});




}
/// @nodoc
class _$RegistrationCopyWithImpl<$Res>
    implements $RegistrationCopyWith<$Res> {
  _$RegistrationCopyWithImpl(this._self, this._then);

  final Registration _self;
  final $Res Function(Registration) _then;

/// Create a copy of Registration
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? eventId = null,Object? registeredAt = null,Object? status = null,}) {
  return _then(Registration(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,registeredAt: null == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RegistrationStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [Registration].
extension RegistrationPatterns on Registration {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Registration value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Registration() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Registration value)  $default,){
final _that = this;
switch (_that) {
case _Registration():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Registration value)?  $default,){
final _that = this;
switch (_that) {
case _Registration() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String eventId,  DateTime registeredAt,  RegistrationStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Registration() when $default != null:
return $default(_that.id,_that.userId,_that.eventId,_that.registeredAt,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String eventId,  DateTime registeredAt,  RegistrationStatus status)  $default,) {final _that = this;
switch (_that) {
case _Registration():
return $default(_that.id,_that.userId,_that.eventId,_that.registeredAt,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String eventId,  DateTime registeredAt,  RegistrationStatus status)?  $default,) {final _that = this;
switch (_that) {
case _Registration() when $default != null:
return $default(_that.id,_that.userId,_that.eventId,_that.registeredAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _Registration implements Registration {
  const _Registration({required this.id, required this.userId, required this.eventId, required this.registeredAt, required this.status});
  

@override final  String id;
@override final  String userId;
@override final  String eventId;
@override final  DateTime registeredAt;
@override final  RegistrationStatus status;

/// Create a copy of Registration
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationCopyWith<_Registration> get copyWith => __$RegistrationCopyWithImpl<_Registration>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Registration&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.eventId, eventId) || other.eventId == eventId)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,eventId,registeredAt,status);
}

@override
String toString() {
    return 'Registration(id: $id, userId: $userId, eventId: $eventId, registeredAt: $registeredAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RegistrationCopyWith<$Res> implements $RegistrationCopyWith<$Res> {
  factory _$RegistrationCopyWith(_Registration value, $Res Function(_Registration) _then) = __$RegistrationCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String eventId, DateTime registeredAt, RegistrationStatus status
});




}
/// @nodoc
class __$RegistrationCopyWithImpl<$Res>
    implements _$RegistrationCopyWith<$Res> {
  __$RegistrationCopyWithImpl(this._self, this._then);

  final _Registration _self;
  final $Res Function(_Registration) _then;

/// Create a copy of Registration
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? eventId = null,Object? registeredAt = null,Object? status = null,}) {
  return _then(_Registration(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,eventId: null == eventId ? _self.eventId : eventId // ignore: cast_nullable_to_non_nullable
as String,registeredAt: null == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RegistrationStatus,
  ));
}


}

// dart format on
