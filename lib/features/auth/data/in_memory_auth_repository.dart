import 'package:campus_events_clubs/features/auth/domain/auth_repository.dart';
import 'package:campus_events_clubs/features/auth/domain/user.dart';

// This class holds 3 fake users in memory (no real login needed for Milestone 1).
class InMemoryAuthRepository implements AuthRepository {
  // The 3 demo users — one per role
  final List<User> _users = [
    User(
      id: 'user-student-1',
      fullName: 'Abebe Kebede',
      email: 'abebe.kebede@university.edu',
      programme: 'Computer Science',
      role: UserRole.student,
      createdAt: DateTime(2024, 9, 1),
    ),
    User(
      id: 'user-organizer-1',
      fullName: 'Sara Tesfaye',
      email: 'sara.tesfaye@university.edu',
      programme: 'Business Administration',
      role: UserRole.organizer,
      createdAt: DateTime(2024, 9, 1),
    ),
    User(
      id: 'user-coordinator-1',
      fullName: 'Dr. Yohannes Alemu',
      email: 'y.alemu@university.edu',
      programme: 'Department Coordination',
      role: UserRole.coordinator,
      createdAt: DateTime(2023, 1, 15),
    ),
  ];

  // Keep track of who is currently signed in
  User? _currentUser;

  // Start with the student signed in by default
  InMemoryAuthRepository() {
    _currentUser = _users[0];
  }

  @override
  User? getCurrentUser() {
    return _currentUser;
  }

  @override
  Future<User> signInAsRole(UserRole role) async {
    // Find the demo user that matches the chosen role
    for (User user in _users) {
      if (user.role == role) {
        _currentUser = user;
        return user;
      }
    }
    // This should never happen since we have all 3 roles
    throw Exception('No demo user found for role $role');
  }

  @override
  Future<void> signOut() async {
    _currentUser = null;
  }

  @override
  List<User> getDemoUsers() {
    return _users;
  }
}
