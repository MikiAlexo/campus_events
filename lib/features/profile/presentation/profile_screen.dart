import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:campus_events_clubs/features/auth/domain/user.dart';
import 'package:campus_events_clubs/features/auth/data/in_memory_auth_repository.dart';
import 'package:campus_events_clubs/core/theme/app_theme.dart';

/// User profile, role switcher, and application settings screen.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = context.read<InMemoryAuthRepository>();
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
  final User user;
  final InMemoryAuthRepository authRepo;

  const _UserProfile({
    required this.user,
    required this.authRepo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User avatar and details
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

          // Settings sections
          _SettingsSection(
            title: 'Application Settings',
            children: [
              // Theme toggle
              ListTile(
                leading: const Icon(Icons.brightness_4),
                title: const Text('Theme'),
                trailing: const Icon(Icons.arrow_forward_ios_small),
                onTap: () {
                  // TODO: implement theme toggle
                },
              ),
              // Notification toggle
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notifications'),
                trailing: Switch(
                  value: true,
                  onChanged: (_) {
                    // TODO: implement notification toggle
                  },
                ),
              ),
            ],
          ),

          const Divider(height: 32),

          // Sign out button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => authRepo.signOut(),
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

  Icon _getIconForRole(UserRole role) {
    switch (role) {
      case UserRole.student:
        return Icons.person_student;
      case UserRole.organizer:
        return Icons.person;
      case UserRole.coordinator:
        return Icons.badge;
    }
  }
}

class _RoleInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _RoleInfoRow({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

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
  @override
  Widget build(BuildContext context) {
    final authRepo = context.read<InMemoryAuthRepository>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Please sign in to view your profile'),
          SizedBox(height: 16),
          FilledButton(
            onPressed: () => context.go('/login'),
            child: Text('Sign In'),
          ),
        ],
      ),
    );
  }
}