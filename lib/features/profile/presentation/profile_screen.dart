import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// User profile, role switcher, and application settings screen.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile & Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Profile / Settings Screen (Milestone 1 stub)'),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () => context.push('/coordinator/schedule'),
            icon: const Icon(Icons.calendar_month),
            label: const Text('Department Schedule Overview'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => context.go('/login'),
            icon: const Icon(Icons.logout),
            label: const Text('Sign Out / Switch Account'),
          ),
        ],
      ),
    );
  }
}
