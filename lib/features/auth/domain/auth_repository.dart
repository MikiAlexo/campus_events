import 'package:campus_events_clubs/features/auth/domain/user.dart';

/// Contract for authentication and role switching.
abstract interface class AuthRepository {
  User? getCurrentUser();
  Future<User> signInAsRole(UserRole role);
  Future<void> signOut();
  List<User> getDemoUsers();
}
