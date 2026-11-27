import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Home screen for discovering and filtering campus events.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Discover Events')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Home / Discover Events Screen (Milestone 1 stub)'),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              title: const Text('Sample Event: Annual Robotics Showcase'),
              subtitle: const Text('Tech • Main Auditorium'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push('/events/event-1'),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => context.push('/coordinator/schedule'),
            icon: const Icon(Icons.calendar_month),
            label: const Text('Department Schedule Overview'),
          ),
        ],
      ),
    );
  }
}
