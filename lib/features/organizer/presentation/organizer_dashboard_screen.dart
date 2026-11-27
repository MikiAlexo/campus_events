import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Dashboard for club organizers to manage published events and check-ins.
class OrganizerDashboardScreen extends StatelessWidget {
  const OrganizerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Organizer Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Organizer Dashboard Screen (Milestone 1 stub)'),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: () => context.push('/organizer/events/new'),
            icon: const Icon(Icons.add),
            label: const Text('Create New Event'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => context.push('/organizer/events/event-1/edit'),
            icon: const Icon(Icons.edit),
            label: const Text('Edit Sample Event'),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: () => context.push('/organizer/scanner'),
            icon: const Icon(Icons.qr_code_scanner),
            label: const Text('Scan Attendee Tickets'),
          ),
        ],
      ),
    );
  }
}
