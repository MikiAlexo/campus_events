// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Event {

 String get id; String get title; String get description; EventCategory get category; DateTime get startDateTime; DateTime get endDateTime; String get agenda; String get speakerName; String get speakerBio; String get imageUrl; int get participantLimit; String get organizerId; String get clubId; String get venueId;
/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCopyWith<Event> get copyWith => _$EventCopyWithImpl<Event>(this as Event, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Event;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Event&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.startDateTime, _this.startDateTime) || other.startDateTime == _this.startDateTime)&&(identical(other.endDateTime, _this.endDateTime) || other.endDateTime == _this.endDateTime)&&(identical(other.agenda, _this.agenda) || other.agenda == _this.agenda)&&(identical(other.speakerName, _this.speakerName) || other.speakerName == _this.speakerName)&&(identical(other.speakerBio, _this.speakerBio) || other.speakerBio == _this.speakerBio)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.participantLimit, _this.participantLimit) || other.participantLimit == _this.participantLimit)&&(identical(other.organizerId, _this.organizerId) || other.organizerId == _this.organizerId)&&(identical(other.clubId, _this.clubId) || other.clubId == _this.clubId)&&(identical(other.venueId, _this.venueId) || other.venueId == _this.venueId));
}


@override
int get hashCode {
  final _this = this as Event;
  return Object.hash(runtimeType,_this.id,_this.title,_this.description,_this.category,_this.startDateTime,_this.endDateTime,_this.agenda,_this.speakerName,_this.speakerBio,_this.imageUrl,_this.participantLimit,_this.organizerId,_this.clubId,_this.venueId);
}

@override
String toString() {
  final _this = this as Event;
  return 'Event(id: ${_this.id}, title: ${_this.title}, description: ${_this.description}, category: ${_this.category}, startDateTime: ${_this.startDateTime}, endDateTime: ${_this.endDateTime}, agenda: ${_this.agenda}, speakerName: ${_this.speakerName}, speakerBio: ${_this.speakerBio}, imageUrl: ${_this.imageUrl}, participantLimit: ${_this.participantLimit}, organizerId: ${_this.organizerId}, clubId: ${_this.clubId}, venueId: ${_this.venueId})';
}


}

/// @nodoc
abstract mixin class $EventCopyWith<$Res>  {
  factory $EventCopyWith(Event value, $Res Function(Event) _then) = _$EventCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, EventCategory category, DateTime startDateTime, DateTime endDateTime, String agenda, String speakerName, String speakerBio, String imageUrl, int participantLimit, String organizerId, String clubId, String venueId
});




}
/// @nodoc
class _$EventCopyWithImpl<$Res>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._self, this._then);

  final Event _self;
  final $Res Function(Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? category = null,Object? startDateTime = null,Object? endDateTime = null,Object? agenda = null,Object? speakerName = null,Object? speakerBio = null,Object? imageUrl = null,Object? participantLimit = null,Object? organizerId = null,Object? clubId = null,Object? venueId = null,}) {
  return _then(Event(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as EventCategory,startDateTime: null == startDateTime ? _self.startDateTime : startDateTime // ignore: cast_nullable_to_non_nullable
as DateTime,endDateTime: null == endDateTime ? _self.endDateTime : endDateTime // ignore: cast_nullable_to_non_nullable
as DateTime,agenda: null == agenda ? _self.agenda : agenda // ignore: cast_nullable_to_non_nullable
as String,speakerName: null == speakerName ? _self.speakerName : speakerName // ignore: cast_nullable_to_non_nullable
as String,speakerBio: null == speakerBio ? _self.speakerBio : speakerBio // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,participantLimit: null == participantLimit ? _self.participantLimit : participantLimit // ignore: cast_nullable_to_non_nullable
as int,organizerId: null == organizerId ? _self.organizerId : organizerId // ignore: cast_nullable_to_non_nullable
as String,clubId: null == clubId ? _self.clubId : clubId // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Event].
extension EventPatterns on Event {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Event value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Event() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Event value)  $default,){
final _that = this;
switch (_that) {
case _Event():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Event value)?  $default,){
final _that = this;
switch (_that) {
case _Event() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  EventCategory category,  DateTime startDateTime,  DateTime endDateTime,  String agenda,  String speakerName,  String speakerBio,  String imageUrl,  int participantLimit,  String organizerId,  String clubId,  String venueId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.startDateTime,_that.endDateTime,_that.agenda,_that.speakerName,_that.speakerBio,_that.imageUrl,_that.participantLimit,_that.organizerId,_that.clubId,_that.venueId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  EventCategory category,  DateTime startDateTime,  DateTime endDateTime,  String agenda,  String speakerName,  String speakerBio,  String imageUrl,  int participantLimit,  String organizerId,  String clubId,  String venueId)  $default,) {final _that = this;
switch (_that) {
case _Event():
return $default(_that.id,_that.title,_that.description,_that.category,_that.startDateTime,_that.endDateTime,_that.agenda,_that.speakerName,_that.speakerBio,_that.imageUrl,_that.participantLimit,_that.organizerId,_that.clubId,_that.venueId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  EventCategory category,  DateTime startDateTime,  DateTime endDateTime,  String agenda,  String speakerName,  String speakerBio,  String imageUrl,  int participantLimit,  String organizerId,  String clubId,  String venueId)?  $default,) {final _that = this;
switch (_that) {
case _Event() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.startDateTime,_that.endDateTime,_that.agenda,_that.speakerName,_that.speakerBio,_that.imageUrl,_that.participantLimit,_that.organizerId,_that.clubId,_that.venueId);case _:
  return null;

}
}

}

/// @nodoc


class _Event implements Event {
  const _Event({required this.id, required this.title, required this.description, required this.category, required this.startDateTime, required this.endDateTime, required this.agenda, required this.speakerName, required this.speakerBio, required this.imageUrl, required this.participantLimit, required this.organizerId, required this.clubId, required this.venueId});
  

@override final  String id;
@override final  String title;
@override final  String description;
@override final  EventCategory category;
@override final  DateTime startDateTime;
@override final  DateTime endDateTime;
@override final  String agenda;
@override final  String speakerName;
@override final  String speakerBio;
@override final  String imageUrl;
@override final  int participantLimit;
@override final  String organizerId;
@override final  String clubId;
@override final  String venueId;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCopyWith<_Event> get copyWith => __$EventCopyWithImpl<_Event>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Event&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.startDateTime, startDateTime) || other.startDateTime == startDateTime)&&(identical(other.endDateTime, endDateTime) || other.endDateTime == endDateTime)&&(identical(other.agenda, agenda) || other.agenda == agenda)&&(identical(other.speakerName, speakerName) || other.speakerName == speakerName)&&(identical(other.speakerBio, speakerBio) || other.speakerBio == speakerBio)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.participantLimit, participantLimit) || other.participantLimit == participantLimit)&&(identical(other.organizerId, organizerId) || other.organizerId == organizerId)&&(identical(other.clubId, clubId) || other.clubId == clubId)&&(identical(other.venueId, venueId) || other.venueId == venueId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,title,description,category,startDateTime,endDateTime,agenda,speakerName,speakerBio,imageUrl,participantLimit,organizerId,clubId,venueId);
}

@override
String toString() {
    return 'Event(id: $id, title: $title, description: $description, category: $category, startDateTime: $startDateTime, endDateTime: $endDateTime, agenda: $agenda, speakerName: $speakerName, speakerBio: $speakerBio, imageUrl: $imageUrl, participantLimit: $participantLimit, organizerId: $organizerId, clubId: $clubId, venueId: $venueId)';
}


}

/// @nodoc
abstract mixin class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) _then) = __$EventCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, EventCategory category, DateTime startDateTime, DateTime endDateTime, String agenda, String speakerName, String speakerBio, String imageUrl, int participantLimit, String organizerId, String clubId, String venueId
});




}
/// @nodoc
class __$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(this._self, this._then);

  final _Event _self;
  final $Res Function(_Event) _then;

/// Create a copy of Event
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? category = null,Object? startDateTime = null,Object? endDateTime = null,Object? agenda = null,Object? speakerName = null,Object? speakerBio = null,Object? imageUrl = null,Object? participantLimit = null,Object? organizerId = null,Object? clubId = null,Object? venueId = null,}) {
  return _then(_Event(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as EventCategory,startDateTime: null == startDateTime ? _self.startDateTime : startDateTime // ignore: cast_nullable_to_non_nullable
as DateTime,endDateTime: null == endDateTime ? _self.endDateTime : endDateTime // ignore: cast_nullable_to_non_nullable
as DateTime,agenda: null == agenda ? _self.agenda : agenda // ignore: cast_nullable_to_non_nullable
as String,speakerName: null == speakerName ? _self.speakerName : speakerName // ignore: cast_nullable_to_non_nullable
as String,speakerBio: null == speakerBio ? _self.speakerBio : speakerBio // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,participantLimit: null == participantLimit ? _self.participantLimit : participantLimit // ignore: cast_nullable_to_non_nullable
as int,organizerId: null == organizerId ? _self.organizerId : organizerId // ignore: cast_nullable_to_non_nullable
as String,clubId: null == clubId ? _self.clubId : clubId // ignore: cast_nullable_to_non_nullable
as String,venueId: null == venueId ? _self.venueId : venueId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
