import 'package:freezed_annotation/freezed_annotation.dart';

part 'venue.freezed.dart';

/// Represents a campus venue where events can be hosted.
@freezed
abstract class Venue with _$Venue {
  const factory Venue({
    required String id,
    required String name,
    required String building,
    required String room,
    required int capacity,
    required double latitude,
    required double longitude,
  }) = _Venue;
}
