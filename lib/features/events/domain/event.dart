import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

/// Categories for filtering campus events.
enum EventCategory {
  tech,
  social,
  career,
  arts,
  sports,
}

/// Represents a campus event published by a club organizer.
@freezed
abstract class Event with _$Event {
  const factory Event({
    required String id,
    required String title,
    required String description,
    required EventCategory category,
    required DateTime startDateTime,
    required DateTime endDateTime,
    required String agenda,
    required String speakerName,
    required String speakerBio,
    required String imageUrl,
    required int participantLimit,
    required String organizerId,
    required String clubId,
    required String venueId,
  }) = _Event;
}
