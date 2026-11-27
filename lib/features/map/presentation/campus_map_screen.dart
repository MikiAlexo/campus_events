import 'package:flutter/material.dart';
import 'package:campus_events_clubs/core/data/repository_providers.dart';
import 'package:campus_events_clubs/features/events/data/in_memory_event_repository.dart';
import 'package:campus_events_clubs/features/events/domain/event.dart';
import 'package:campus_events_clubs/features/events/domain/event_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Interactive campus map screen showing event venue markers.
class CampusMapScreen extends StatelessWidget {
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
                      subtitle: Text('\ - Room '),
                      trailing: Text('Capacity: '),
                      onTap: () {
                        // Show events at this venue
                      },
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
                      subtitle: Text('\ - '),
                      trailing: _getCategoryBadge(event.category),
                      onTap: () {
                        // Navigate to event details
                      },
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

  Icon _getCategoryIcon(EventCategory category) {
    switch (category) {
      case EventCategory.tech: return Icons.smart_toy;
      case EventCategory.social: return Icons.people;
      case EventCategory.career: return Icons.business;
      case EventCategory.arts: return Icons.brush;
      case EventCategory.sports: return Icons.sports_esports;
    }
  }

  Widget _getCategoryBadge(EventCategory category) {
    final color = _getCategoryColor(category);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        category.toString().split('.').last,
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }

  Color _getCategoryColor(EventCategory category) {
    switch (category) {
      case EventCategory.tech: return Colors.blue;
      case EventCategory.social: return Colors.purple;
      case EventCategory.career: return Colors.green;
      case EventCategory.arts: return Colors.orange;
      case EventCategory.sports: return Colors.red;
    }
  }
}
