import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// Roles supported by the Campus Events and Clubs app.
enum UserRole {
  student,
  organizer,
  coordinator,
}

/// Represents an application user (student, club organizer, or coordinator).
@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String fullName,
    required String email,
    required String programme,
    required UserRole role,
    required DateTime createdAt,
  }) = _User;
}
