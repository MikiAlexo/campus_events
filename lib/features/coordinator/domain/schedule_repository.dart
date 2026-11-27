import 'package:campus_events_clubs/features/events/domain/event.dart';
import 'package:campus_events_clubs/features/events/domain/venue.dart';

/// Represents two events booked at the same venue with overlapping times.
class VenueConflict {
  const VenueConflict({
    required this.venue,
    required this.firstEvent,
    required this.secondEvent,
  });

  final Venue venue;
  final Event firstEvent;
  final Event secondEvent;
}

/// Contract for coordinator schedule inspection and venue conflict detection.
abstract interface class ScheduleRepository {
  List<Event> getEventsForVenue(String venueId);
  List<VenueConflict> findVenueConflicts();
}
