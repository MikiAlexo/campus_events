import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:campus_events_clubs/core/data/repository_providers.dart';
import 'package:campus_events_clubs/features/coordinator/domain/schedule_repository.dart';
import 'package:campus_events_clubs/features/events/domain/event.dart';
import 'package:campus_events_clubs/features/events/domain/venue.dart';

// ── Providers ─────────────────────────────────────────────────────────────

// Provides the list of all venue conflicts
final venueConflictsProvider = Provider<List<VenueConflict>>((ref) {
  return ref.watch(scheduleRepositoryProvider).findVenueConflicts();
});

// Provides the list of all venues
final allVenuesProvider = Provider<List<Venue>>((ref) {
  return ref.watch(eventRepositoryProvider).getVenues();
});

// ── Main Screen ───────────────────────────────────────────────────────────

// This screen shows all venue bookings and highlights any scheduling conflicts.
class DepartmentScheduleScreen extends ConsumerWidget {
  const DepartmentScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Venue> venues = ref.watch(allVenuesProvider);
    final List<VenueConflict> conflicts = ref.watch(venueConflictsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Department Schedule'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Show a warning banner if there are conflicts
          if (conflicts.isNotEmpty) _ConflictBanner(count: conflicts.length),

          // Show each conflict card
          if (conflicts.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Text(
              'Scheduling Conflicts',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            for (final VenueConflict conflict in conflicts)
              _ConflictCard(conflict: conflict),
            const SizedBox(height: 20),
          ],

          // Show all venue bookings
          const Text(
            'All Venue Bookings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          for (final Venue venue in venues)
            _VenueSection(venue: venue, ref: ref),
        ],
      ),
    );
  }
}

// ── Conflict Banner ───────────────────────────────────────────────────────

class _ConflictBanner extends StatelessWidget {
  final int count;

  const _ConflictBanner({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red[50],
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.red),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '$count venue conflict(s) detected! Review overlapping bookings below.',
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Conflict Card ─────────────────────────────────────────────────────────

class _ConflictCard extends StatelessWidget {
  final VenueConflict conflict;

  const _ConflictCard({required this.conflict});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red[50],
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Venue name
            Text(
              '${conflict.venue.name}  —  ${conflict.venue.building}, Room ${conflict.venue.room}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(),
            // First conflicting event
            Text('Event A: ${conflict.firstEvent.title}'),
            Text(
              '  ${_formatDate(conflict.firstEvent.startDateTime)} – ${_formatDate(conflict.firstEvent.endDateTime)}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 6),
            // Second conflicting event
            Text('Event B: ${conflict.secondEvent.title}'),
            Text(
              '  ${_formatDate(conflict.secondEvent.startDateTime)} – ${_formatDate(conflict.secondEvent.endDateTime)}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Helper to format a DateTime as a readable string
  String _formatDate(DateTime dt) {
    final String month = dt.month.toString().padLeft(2, '0');
    final String day = dt.day.toString().padLeft(2, '0');
    final String hour = dt.hour.toString().padLeft(2, '0');
    final String minute = dt.minute.toString().padLeft(2, '0');
    return '${dt.year}-$month-$day  $hour:$minute';
  }
}

// ── Venue Section ─────────────────────────────────────────────────────────

class _VenueSection extends StatelessWidget {
  final Venue venue;
  final WidgetRef ref;

  const _VenueSection({required this.venue, required this.ref});

  @override
  Widget build(BuildContext context) {
    // Get all events booked at this venue
    final List<Event> events = ref.watch(scheduleRepositoryProvider).getEventsForVenue(venue.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Venue header
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.only(bottom: 6),
          color: Colors.grey[200],
          child: Text(
            '${venue.name}  |  ${venue.building}  |  Capacity: ${venue.capacity}',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),

        // Show each event booked at this venue
        if (events.isEmpty)
          const Padding(
            padding: EdgeInsets.only(left: 12, bottom: 8),
            child: Text('No events scheduled.', style: TextStyle(color: Colors.grey)),
          ),

        for (final Event event in events)
          _EventTile(event: event),

        const SizedBox(height: 12),
      ],
    );
  }
}

// ── Event Tile ─────────────────────────────────────────────────────────────

class _EventTile extends StatelessWidget {
  final Event event;

  const _EventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 6),
      child: ListTile(
        leading: const Icon(Icons.event),
        title: Text(event.title),
        subtitle: Text(
          '${_formatDate(event.startDateTime)} – ${_formatDate(event.endDateTime)}\n'
          'Category: ${event.category.name}',
        ),
        isThreeLine: true,
      ),
    );
  }

  String _formatDate(DateTime dt) {
    final String month = dt.month.toString().padLeft(2, '0');
    final String day = dt.day.toString().padLeft(2, '0');
    final String hour = dt.hour.toString().padLeft(2, '0');
    final String minute = dt.minute.toString().padLeft(2, '0');
    return '${dt.year}-$month-$day $hour:$minute';
  }
}
