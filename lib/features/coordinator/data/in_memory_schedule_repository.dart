import 'package:campus_events_clubs/features/coordinator/domain/schedule_repository.dart';
import 'package:campus_events_clubs/features/events/domain/event.dart';
import 'package:campus_events_clubs/features/events/domain/event_repository.dart';
import 'package:campus_events_clubs/features/events/domain/venue.dart';

// This class reads from the event repository to find bookings and conflicts.
class InMemoryScheduleRepository implements ScheduleRepository {
  // Use initializing formal (this._eventRepository) instead of body assignment
  InMemoryScheduleRepository({required this._eventRepository});

  final EventRepository _eventRepository;

  @override
  List<Event> getEventsForVenue(String venueId) {
    final List<Event> allEvents = _eventRepository.getEvents();
    final List<Event> result = [];

    // Keep only events that belong to this venue
    for (final Event event in allEvents) {
      if (event.venueId == venueId) {
        result.add(event);
      }
    }

    // Sort by start time so they appear in chronological order
    result.sort((a, b) => a.startDateTime.compareTo(b.startDateTime));

    return result;
  }

  @override
  List<VenueConflict> findVenueConflicts() {
    final List<Event> allEvents = _eventRepository.getEvents();
    final List<VenueConflict> conflicts = [];

    // Compare every pair of events to see if they conflict
    for (int i = 0; i < allEvents.length; i++) {
      for (int j = i + 1; j < allEvents.length; j++) {
        final Event eventA = allEvents[i];
        final Event eventB = allEvents[j];

        // They can only conflict if they are at the same venue
        if (eventA.venueId != eventB.venueId) {
          continue;
        }

        // Two events overlap if one starts before the other ends
        // Example: A is 09:00–12:00, B is 10:30–13:00 → they overlap
        final bool aStartsBeforeBEnds = eventA.startDateTime.isBefore(eventB.endDateTime);
        final bool bStartsBeforeAEnds = eventB.startDateTime.isBefore(eventA.endDateTime);

        if (aStartsBeforeBEnds && bStartsBeforeAEnds) {
          // We have a conflict — look up the venue details
          final Venue? venue = _eventRepository.getVenueById(eventA.venueId);
          if (venue != null) {
            conflicts.add(
              VenueConflict(
                venue: venue,
                firstEvent: eventA,
                secondEvent: eventB,
              ),
            );
          }
        }
      }
    }

    return conflicts;
  }
}
