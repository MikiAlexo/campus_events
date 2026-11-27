import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Displays full details for a single campus event.
class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({required this.eventId, super.key});

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Event ID: $eventId',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.push('/events/$eventId/rsvp-confirm'),
              child: const Text('RSVP for Event'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => context.push('/events/$eventId/ai-summary'),
              child: const Text('View AI Event Summary'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => context.go('/map'),
              child: const Text('View Venue on Campus Map'),
            ),
          ],
        ),
      ),
    );
  }
}
