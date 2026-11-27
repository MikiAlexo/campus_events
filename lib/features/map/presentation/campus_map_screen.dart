import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:campus_events_clubs/core/data/repository_providers.dart';
import 'package:campus_events_clubs/features/events/domain/event.dart';

/// Interactive campus map screen showing event venue markers.
class CampusMapScreen extends ConsumerWidget {
  const CampusMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventRepository = ref.read(eventRepositoryProvider);
    final events = eventRepository.getEvents();
    final venues = eventRepository.getVenues();

    return Scaffold(
      appBar: AppBar(title: const Text('Campus Map')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Available Venues'),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: venues.length,
                itemBuilder: (context, index) {
                  final venue = venues[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(venue.name),
                      subtitle: Text('${venue.building} - Room ${venue.room}'),
                      trailing: Text('Capacity: ${venue.capacity}'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const Text('Upcoming Events'),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: Icon(_getCategoryIcon(event.category)),
                      title: Text(event.title),
                      subtitle: Text(event.speakerName),
                      trailing: _getCategoryBadge(event.category),
                      onTap: () => context.push('/events/${event.id}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(EventCategory category) {
    switch (category) {
      case EventCategory.tech:
        return Icons.smart_toy;
      case EventCategory.social:
        return Icons.people;
      case EventCategory.career:
        return Icons.business;
      case EventCategory.arts:
        return Icons.brush;
      case EventCategory.sports:
        return Icons.sports_esports;
    }
  }

  Widget _getCategoryBadge(EventCategory category) {
    final color = _getCategoryColor(category);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        category.name,
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }

  Color _getCategoryColor(EventCategory category) {
    switch (category) {
      case EventCategory.tech:
        return Colors.blue;
      case EventCategory.social:
        return Colors.purple;
      case EventCategory.career:
        return Colors.green;
      case EventCategory.arts:
        return Colors.orange;
      case EventCategory.sports:
        return Colors.red;
    }
  }
}
