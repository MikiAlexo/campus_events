import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:campus_events_clubs/core/data/repository_providers.dart';
import 'package:campus_events_clubs/features/auth/domain/auth_repository.dart';
import 'package:campus_events_clubs/features/auth/domain/user.dart';

/// User profile, role switcher, and application settings screen.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authRepo = ref.read(authRepositoryProvider);
    final currentUser = authRepo.getCurrentUser();

    return Scaffold(
      appBar: AppBar(title: const Text('Profile & Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: currentUser != null
            ? _UserProfile(user: currentUser, authRepo: authRepo)
            : const _SignInPrompt(),
      ),
    );
  }
}

class _UserProfile extends StatelessWidget {
  const _UserProfile({
    required this.user,
    required this.authRepo,
  });

  final User user;
  final AuthRepository authRepo;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: colorScheme.primaryContainer,
            child: Icon(
              _getIconForRole(user.role),
              size: 40,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            user.fullName,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          _RoleInfoRow(
            icon: Icons.school,
            label: 'Programme',
            value: user.programme,
          ),
          _RoleInfoRow(
            icon: Icons.badge,
            label: 'Role',
            value: user.role.name.toUpperCase(),
          ),
          const Divider(height: 32),
          Text(
            'Application Settings',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.brightness_4),
            title: const Text('Theme'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (_) {},
            ),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Department Schedule Overview'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.push('/coordinator/schedule'),
          ),
          const Divider(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                await authRepo.signOut();
                if (!context.mounted) return;
                context.go('/login');
              },
              icon: const Icon(Icons.logout),
              label: const Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  IconData _getIconForRole(UserRole role) {
    switch (role) {
      case UserRole.student:
        return Icons.school;
      case UserRole.organizer:
        return Icons.person;
      case UserRole.coordinator:
        return Icons.badge;
    }
  }
}

class _RoleInfoRow extends StatelessWidget {
  const _RoleInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SignInPrompt extends StatelessWidget {
  const _SignInPrompt();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Please sign in to view your profile'),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => context.go('/login'),
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
