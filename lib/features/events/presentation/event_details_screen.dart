import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:campus_events_clubs/core/data/repository_providers.dart';
import 'package:campus_events_clubs/features/events/domain/club.dart';

/// Displays full details for a single campus event.
class EventDetailsScreen extends ConsumerWidget {
  const EventDetailsScreen({required this.eventId, super.key});

  final String eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(eventRepositoryProvider);
    final event = repo.getEventById(eventId);
    final venue = event != null ? repo.getVenueById(event.venueId) : null;
    final club = event != null
        ? repo.getClubs().firstWhere(
              (c) => c.id == event.clubId,
              orElse: () => const Club(
                id: 'club-default',
                name: 'Campus Club',
                description: '',
                organizerId: '',
              ),
            )
        : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Event Details')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (event != null) ...[
                Text(
                  event.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                _InfoRow(
                  icon: Icons.calendar_today,
                  label: 'Date',
                  value: event.startDateTime.toString().split(' ')[0],
                ),
                _InfoRow(
                  icon: Icons.location_on,
                  label: 'Venue',
                  value: venue != null
                      ? '${venue.name} (${venue.building}, Room ${venue.room})'
                      : 'Venue not available',
                ),
                _InfoRow(
                  icon: Icons.group,
                  label: 'Club',
                  value: club != null ? club.name : 'Unknown club',
                ),
                const Divider(height: 32),
                _InfoRow(
                  icon: Icons.description,
                  label: 'Agenda',
                  value: event.agenda,
                ),
                const Divider(height: 32),
                _InfoRow(
                  icon: Icons.person,
                  label: 'Speaker',
                  value: event.speakerName,
                ),
                const SizedBox(height: 8),
                Text(
                  event.speakerBio.isNotEmpty
                      ? 'About: ${event.speakerBio}'
                      : 'Speaker biography not available',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Divider(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () =>
                            context.push('/events/${event.id}/rsvp-confirm'),
                        child: const Text('RSVP for Event'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () =>
                            context.push('/events/${event.id}/ai-summary'),
                        child: const Text('View AI Event Summary'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () => context.go('/map'),
                  icon: const Icon(Icons.map),
                  label: const Text('View Venue on Campus Map'),
                ),
              ] else ...[
                const Text('Event not found'),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
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
