import 'package:freezed_annotation/freezed_annotation.dart';

part 'club.freezed.dart';

/// Represents a student club that hosts campus events.
@freezed
abstract class Club with _$Club {
  const factory Club({
    required String id,
    required String name,
    required String description,
    required String organizerId,
  }) = _Club;
}
