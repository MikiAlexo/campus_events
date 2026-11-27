import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:campus_events_clubs/core/data/repository_providers.dart';

/// Dashboard for club organizers to manage published events and check-ins.
class OrganizerDashboardScreen extends ConsumerWidget {
  const OrganizerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventRepository = ref.read(eventRepositoryProvider);
    final ticketRepository = ref.read(ticketRepositoryProvider);
    const organizerId = 'user-organizer-1';
    final events = eventRepository.getEvents();
    final organizerEvents =
        events.where((e) => e.organizerId == organizerId).toList();
    final registrations =
        ticketRepository.getRegistrationsForUser('user-student-1');

    return Scaffold(
      appBar: AppBar(title: const Text('Organizer Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Your Events'),
          const SizedBox(height: 8),
          ...organizerEvents.map(
            (event) => Card(
              margin: const EdgeInsets.symmetric(vertical: 4),
              child: ListTile(
                title: Text(event.title),
                subtitle: Text(event.category.name),
                trailing: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                onTap: () => context.push('/events/${event.id}'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('Sample Registrations: ${registrations.length}'),
          const SizedBox(height: 8),
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
