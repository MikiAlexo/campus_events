import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:campus_events_clubs/core/data/repository_providers.dart';

/// Displays the user's registered events and digital QR tickets.
class MyTicketsScreen extends ConsumerWidget {
  const MyTicketsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketRepository = ref.read(ticketRepositoryProvider);
    final registrations =
        ticketRepository.getRegistrationsForUser('user-student-1');

    return Scaffold(
      appBar: AppBar(title: const Text('My Tickets')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Registered Events'),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: registrations.length,
                itemBuilder: (context, index) {
                  final reg = registrations[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text('Event: ${reg.eventId}'),
                      subtitle: Text('Status: ${reg.status.name}'),
                      trailing: const Icon(Icons.qr_code),
                      onTap: () => context.push('/events/${reg.eventId}'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () => context.push('/tickets/offline'),
              icon: const Icon(Icons.offline_pin),
              label: const Text('View Offline Tickets'),
            ),
          ],
        ),
      ),
    );
  }
}
