import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:campus_events_clubs/features/auth/domain/user.dart';
import 'package:campus_events_clubs/features/auth/data/in_memory_auth_repository.dart';

/// Login and registration screen with role selection for Milestone 1.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = context.read<InMemoryAuthRepository>();
    final currentUser = authRepo.getCurrentUser();
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In / Register')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (currentUser == null) ...const [
                Text('Please select your role to continue:'),
                const SizedBox(height: 16),
              ],
              const Text('Select your role:'),
              const SizedBox(height: 8),
              _RoleButton(
                role: UserRole.student,
                label: 'Student',
                onPressed: () async {
                  await authRepo.signInAsRole(UserRole.student);
                  if (!context.mounted) return;
                  context.go('/events');
                },
              ),
              const SizedBox(height: 8),
              _RoleButton(
                role: UserRole.organizer,
                label: 'Organizer',
                onPressed: () async {
                  await authRepo.signInAsRole(UserRole.organizer);
                  if (!context.mounted) return;
                  context.go('/events');
                },
              ),
              const SizedBox(height: 8),
              _RoleButton(
                role: UserRole.coordinator,
                label: 'Coordinator',
                onPressed: () async {
                  await authRepo.signInAsRole(UserRole.coordinator);
                  if (!context.mounted) return;
                  context.go('/events');
                },
              ),
              if (currentUser != null) ...const [
                const SizedBox(height: 24),
                Text('Signed in as: ${currentUser.fullName} \ (\)'),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => authRepo.signOut(),
                  child: const Text('Sign Out'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleButton extends StatelessWidget {
  final UserRole role;
  final String label;
  final VoidCallback onPressed;

  const _RoleButton({
    required this.role,
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final repo = context.read<InMemoryAuthRepository>();
    final isSelected = repo.getCurrentUser()?.role == role;
    return FilledButton(
      onPressed: onPressed,
      child: Text(label),
      style: FilledButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : null,
      ),
    );
  }
}
