import 'package:campus_events_clubs/features/events/domain/club.dart';
import 'package:campus_events_clubs/features/events/domain/event.dart';
import 'package:campus_events_clubs/features/events/domain/event_repository.dart';
import 'package:campus_events_clubs/features/events/domain/venue.dart';

// This class stores all campus data in plain lists — no database needed.
class InMemoryEventRepository implements EventRepository {
  // ── Venues ────────────────────────────────────────────────────────────────
  final List<Venue> _venues = [
    const Venue(
      id: 'venue-1',
      name: 'Main Auditorium',
      building: 'Central Hall',
      room: 'A100',
      capacity: 500,
      latitude: 9.0310,
      longitude: 38.7520,
    ),
    const Venue(
      id: 'venue-2',
      name: 'Tech Lab',
      building: 'Science Block',
      room: 'S201',
      capacity: 60,
      latitude: 9.0315,
      longitude: 38.7525,
    ),
    const Venue(
      id: 'venue-3',
      name: 'Innovation Hub',
      building: 'Engineering Block',
      room: 'E301',
      capacity: 100,
      latitude: 9.0320,
      longitude: 38.7530,
    ),
    const Venue(
      id: 'venue-4',
      name: 'Open Amphitheatre',
      building: 'Campus Grounds',
      room: 'Outdoor',
      capacity: 1000,
      latitude: 9.0305,
      longitude: 38.7515,
    ),
  ];

  // ── Clubs ─────────────────────────────────────────────────────────────────
  final List<Club> _clubs = [
    const Club(
      id: 'club-1',
      name: 'Tech Innovators Club',
      description: 'Exploring the frontiers of software and hardware.',
      organizerId: 'user-organizer-1',
    ),
    const Club(
      id: 'club-2',
      name: 'Career Connect',
      description: 'Bridging students with industry professionals.',
      organizerId: 'user-organizer-1',
    ),
    const Club(
      id: 'club-3',
      name: 'Arts and Culture Society',
      description: 'Celebrating creativity and cultural diversity on campus.',
      organizerId: 'user-organizer-1',
    ),
    const Club(
      id: 'club-4',
      name: 'Campus Sports Federation',
      description: 'Organizing inter-faculty sports tournaments.',
      organizerId: 'user-organizer-1',
    ),
    const Club(
      id: 'club-5',
      name: 'Social Impact Network',
      description: 'Community service and campus social events.',
      organizerId: 'user-organizer-1',
    ),
  ];

  // ── Events ────────────────────────────────────────────────────────────────
  // NOTE: event-1 and event-2 are both at venue-2 (Tech Lab) with
  // overlapping times. This is intentional — it creates a conflict
  // that the DepartmentScheduleScreen will show.
  final List<Event> _events = [
    // --- TECH ---
    Event(
      id: 'event-1',
      title: 'Flutter and Dart Workshop',
      description: 'A hands-on workshop covering Flutter fundamentals and building your first cross-platform app.',
      category: EventCategory.tech,
      startDateTime: DateTime(2024, 12, 5, 9, 0),
      endDateTime: DateTime(2024, 12, 5, 12, 0),
      agenda: '09:00 Intro to Dart\n10:00 Widget basics\n11:00 Build a mini-app',
      speakerName: 'Meron Tadesse',
      speakerBio: 'Senior Flutter developer at a local fintech company with 5 years of experience.',
      imageUrl: 'https://picsum.photos/seed/flutter/800/400',
      participantLimit: 60,
      organizerId: 'user-organizer-1',
      clubId: 'club-1',
      venueId: 'venue-2', // <-- same venue as event-2, overlapping time = CONFLICT
    ),
    Event(
      id: 'event-2',
      title: 'AI and Machine Learning Seminar',
      description: 'Industry experts discuss the latest trends in AI and how to break into the field as a student.',
      category: EventCategory.tech,
      startDateTime: DateTime(2024, 12, 5, 10, 30), // overlaps with event-1 (09:00–12:00)
      endDateTime: DateTime(2024, 12, 5, 13, 0),
      agenda: '10:30 Keynote\n11:30 Panel Q&A\n12:30 Networking',
      speakerName: 'Dr. Kibrom Haile',
      speakerBio: 'AI researcher at AAU with a PhD from MIT.',
      imageUrl: 'https://picsum.photos/seed/aiml/800/400',
      participantLimit: 60,
      organizerId: 'user-organizer-1',
      clubId: 'club-1',
      venueId: 'venue-2', // <-- same venue as event-1 = CONFLICT
    ),
    Event(
      id: 'event-3',
      title: 'Open Source Hackathon',
      description: 'A 6-hour hackathon where teams build solutions to real campus problems.',
      category: EventCategory.tech,
      startDateTime: DateTime(2024, 12, 10, 8, 0),
      endDateTime: DateTime(2024, 12, 10, 14, 0),
      agenda: '08:00 Team formation\n09:00 Hacking\n13:00 Demo pitches',
      speakerName: 'Liya Girma',
      speakerBio: 'Full-stack engineer and open-source contributor.',
      imageUrl: 'https://picsum.photos/seed/hackathon/800/400',
      participantLimit: 100,
      organizerId: 'user-organizer-1',
      clubId: 'club-1',
      venueId: 'venue-3',
    ),
    // --- CAREER ---
    Event(
      id: 'event-4',
      title: 'Career Fair 2024',
      description: 'Meet recruiters from 30+ companies. Bring your CV. All programmes welcome.',
      category: EventCategory.career,
      startDateTime: DateTime(2024, 12, 12, 9, 0),
      endDateTime: DateTime(2024, 12, 12, 17, 0),
      agenda: '09:00 Doors open\n12:00 CV clinic\n16:00 Speed interviews',
      speakerName: 'Hana Worku',
      speakerBio: 'Head of Talent Acquisition at EthioTech.',
      imageUrl: 'https://picsum.photos/seed/careerfair/800/400',
      participantLimit: 500,
      organizerId: 'user-organizer-1',
      clubId: 'club-2',
      venueId: 'venue-1',
    ),
    Event(
      id: 'event-5',
      title: 'Resume and LinkedIn Masterclass',
      description: 'Learn how to build a CV and LinkedIn profile that gets noticed by recruiters.',
      category: EventCategory.career,
      startDateTime: DateTime(2024, 12, 15, 14, 0),
      endDateTime: DateTime(2024, 12, 15, 16, 0),
      agenda: '14:00 Resume tips\n15:00 LinkedIn deep dive\n15:45 Q&A',
      speakerName: 'Bethelehem Assefa',
      speakerBio: 'Professional career coach with 10+ years of experience.',
      imageUrl: 'https://picsum.photos/seed/resume/800/400',
      participantLimit: 100,
      organizerId: 'user-organizer-1',
      clubId: 'club-2',
      venueId: 'venue-3',
    ),
    // --- SOCIAL ---
    Event(
      id: 'event-6',
      title: 'Campus Cultural Night',
      description: 'An evening of food, music, and dance celebrating Ethiopia\'s diverse cultures.',
      category: EventCategory.social,
      startDateTime: DateTime(2024, 12, 20, 18, 0),
      endDateTime: DateTime(2024, 12, 20, 22, 0),
      agenda: '18:00 Food stalls open\n19:00 Performances\n21:00 Open dance',
      speakerName: 'Tsion Bekele',
      speakerBio: 'Campus life coordinator and cultural ambassador.',
      imageUrl: 'https://picsum.photos/seed/cultural/800/400',
      participantLimit: 1000,
      organizerId: 'user-organizer-1',
      clubId: 'club-5',
      venueId: 'venue-4',
    ),
    Event(
      id: 'event-7',
      title: 'Freshman Welcome Mixer',
      description: 'A relaxed gathering for new students to meet their peers and club representatives.',
      category: EventCategory.social,
      startDateTime: DateTime(2024, 12, 2, 15, 0),
      endDateTime: DateTime(2024, 12, 2, 17, 30),
      agenda: '15:00 Ice-breakers\n16:00 Club showcase\n16:45 Free time',
      speakerName: 'Robel Mekonnen',
      speakerBio: 'Student union president.',
      imageUrl: 'https://picsum.photos/seed/mixer/800/400',
      participantLimit: 200,
      organizerId: 'user-organizer-1',
      clubId: 'club-5',
      venueId: 'venue-1',
    ),
    // --- ARTS ---
    Event(
      id: 'event-8',
      title: 'Photography Exhibition',
      description: 'Student photographers showcase their best work from the semester.',
      category: EventCategory.arts,
      startDateTime: DateTime(2024, 12, 18, 10, 0),
      endDateTime: DateTime(2024, 12, 18, 16, 0),
      agenda: '10:00 Gallery opens\n13:00 Artist talks\n15:30 Award ceremony',
      speakerName: 'Fikirte Hailu',
      speakerBio: 'Lecturer in Visual Arts and Photography.',
      imageUrl: 'https://picsum.photos/seed/photo/800/400',
      participantLimit: 100,
      organizerId: 'user-organizer-1',
      clubId: 'club-3',
      venueId: 'venue-3',
    ),
    Event(
      id: 'event-9',
      title: 'Spoken Word and Poetry Night',
      description: 'An intimate evening of spoken word and original poetry by campus artists.',
      category: EventCategory.arts,
      startDateTime: DateTime(2024, 12, 22, 19, 0),
      endDateTime: DateTime(2024, 12, 22, 21, 30),
      agenda: '19:00 Open mic\n20:00 Featured poets\n21:00 Jam session',
      speakerName: 'Natnael Girma',
      speakerBio: 'Poet, playwright, and drama club founder.',
      imageUrl: 'https://picsum.photos/seed/poetry/800/400',
      participantLimit: 150,
      organizerId: 'user-organizer-1',
      clubId: 'club-3',
      venueId: 'venue-4',
    ),
    // --- SPORTS ---
    Event(
      id: 'event-10',
      title: 'Inter-Faculty Football Tournament',
      description: 'The annual inter-faculty 5-a-side football championship. 8 faculties compete.',
      category: EventCategory.sports,
      startDateTime: DateTime(2024, 12, 7, 8, 0),
      endDateTime: DateTime(2024, 12, 7, 18, 0),
      agenda: '08:00 Group stage\n13:00 Semi-finals\n16:00 Final and trophy',
      speakerName: 'Coach Dawit Tefera',
      speakerBio: 'Head of campus sports and certified UEFA coach.',
      imageUrl: 'https://picsum.photos/seed/football/800/400',
      participantLimit: 500,
      organizerId: 'user-organizer-1',
      clubId: 'club-4',
      venueId: 'venue-4',
    ),
    Event(
      id: 'event-11',
      title: 'Chess Championship',
      description: 'Campus-wide chess tournament open to all skill levels. Swiss-system format.',
      category: EventCategory.sports,
      startDateTime: DateTime(2024, 12, 14, 9, 0),
      endDateTime: DateTime(2024, 12, 14, 17, 0),
      agenda: '09:00 Registration\n09:30 Rounds 1-4\n14:00 Rounds 5-7\n16:30 Prizes',
      speakerName: 'Emebet Solomon',
      speakerBio: 'National junior chess champion and campus club president.',
      imageUrl: 'https://picsum.photos/seed/chess/800/400',
      participantLimit: 60,
      organizerId: 'user-organizer-1',
      clubId: 'club-4',
      venueId: 'venue-2',
    ),
  ];

  // ── EventRepository methods ───────────────────────────────────────────────

  @override
  List<Event> getEvents() {
    return _events;
  }

  @override
  Event? getEventById(String id) {
    for (Event event in _events) {
      if (event.id == id) {
        return event;
      }
    }
    return null; // not found
  }

  @override
  List<Event> filterEvents({EventCategory? category, String? query}) {
    final List<Event> result = [];

    for (final Event event in _events) {
      // Check if category matches (or no filter applied)
      final bool categoryMatches = category == null || event.category == category;

      // Check if the search query matches title or description
      bool queryMatches = true;
      if (query != null && query.isNotEmpty) {
        final String lowerQuery = query.toLowerCase();
        final bool inTitle = event.title.toLowerCase().contains(lowerQuery);
        final bool inDescription = event.description.toLowerCase().contains(lowerQuery);
        queryMatches = inTitle || inDescription;
      }

      if (categoryMatches && queryMatches) {
        result.add(event);
      }
    }

    return result;
  }

  @override
  Future<Event> createEvent(Event event) async {
    _events.add(event);
    return event;
  }

  @override
  Future<Event> updateEvent(Event event) async {
    for (int i = 0; i < _events.length; i++) {
      if (_events[i].id == event.id) {
        _events[i] = event;
        return event;
      }
    }
    throw Exception('Event with id ${event.id} not found');
  }

  @override
  List<Club> getClubs() {
    return _clubs;
  }

  @override
  Club? getClubById(String id) {
    for (Club club in _clubs) {
      if (club.id == id) {
        return club;
      }
    }
    return null;
  }

  @override
  List<Venue> getVenues() {
    return _venues;
  }

  @override
  Venue? getVenueById(String id) {
    for (Venue venue in _venues) {
      if (venue.id == id) {
        return venue;
      }
    }
    return null;
  }
}
