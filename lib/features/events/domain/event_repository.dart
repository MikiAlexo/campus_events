import 'package:campus_events_clubs/features/events/domain/club.dart';
import 'package:campus_events_clubs/features/events/domain/event.dart';
import 'package:campus_events_clubs/features/events/domain/venue.dart';

/// Contract for reading and managing campus events, clubs, and venues.
abstract interface class EventRepository {
  List<Event> getEvents();
  Event? getEventById(String id);
  List<Event> filterEvents({EventCategory? category, String? query});
  Future<Event> createEvent(Event event);
  Future<Event> updateEvent(Event event);
  List<Club> getClubs();
  Club? getClubById(String id);
  List<Venue> getVenues();
  Venue? getVenueById(String id);
}
