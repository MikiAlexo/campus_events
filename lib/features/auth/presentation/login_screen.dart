import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:campus_events_clubs/core/data/repository_providers.dart';
import 'package:campus_events_clubs/features/auth/domain/user.dart';

/// Login and registration screen with role selection for Milestone 1.
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepo = ref.read(authRepositoryProvider);
    final currentUser = authRepo.getCurrentUser();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In / Register')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (currentUser == null) ...[
                const Text('Please select your role to continue:'),
                const SizedBox(height: 16),
              ],
              const Text('Select your role:'),
              const SizedBox(height: 8),
              _RoleButton(
                label: 'Student',
                isSelected: currentUser?.role == UserRole.student,
                onPressed: () async {
                  await authRepo.signInAsRole(UserRole.student);
                  if (!context.mounted) return;
                  context.go('/events');
                },
              ),
              const SizedBox(height: 8),
              _RoleButton(
                label: 'Organizer',
                isSelected: currentUser?.role == UserRole.organizer,
                onPressed: () async {
                  await authRepo.signInAsRole(UserRole.organizer);
                  if (!context.mounted) return;
                  context.go('/events');
                },
              ),
              const SizedBox(height: 8),
              _RoleButton(
                label: 'Coordinator',
                isSelected: currentUser?.role == UserRole.coordinator,
                onPressed: () async {
                  await authRepo.signInAsRole(UserRole.coordinator);
                  if (!context.mounted) return;
                  context.go('/events');
                },
              ),
              if (currentUser != null) ...[
                const SizedBox(height: 24),
                Text(
                  'Signed in as: ${currentUser.fullName} (${currentUser.role.name})',
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () async {
                    await authRepo.signOut();
                    if (!context.mounted) return;
                    context.go('/login');
                  },
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
  const _RoleButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : null,
      ),
      child: Text(label),
    );
  }
}
