import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration.freezed.dart';

/// Status of a student's event registration.
enum RegistrationStatus {
  confirmed,
  cancelled,
}

/// Represents a user's RSVP registration for an event.
@freezed
abstract class Registration with _$Registration {
  const factory Registration({
    required String id,
    required String userId,
    required String eventId,
    required DateTime registeredAt,
    required RegistrationStatus status,
  }) = _Registration;
}
