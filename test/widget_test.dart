import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:campus_events_clubs/features/events/data/in_memory_event_repository.dart';
import 'package:campus_events_clubs/features/events/domain/event.dart';
import 'package:campus_events_clubs/features/tickets/data/in_memory_ticket_repository.dart';
import 'package:campus_events_clubs/features/tickets/domain/ticket.dart';
import 'package:campus_events_clubs/main.dart';

void main() {
  // Test 1: Event search/category filtering
  group('Event Search & Category Filtering', () {
    test('filters events by category', () {
      final repo = InMemoryEventRepository();
      final events = repo.filterEvents(category: EventCategory.tech);
      expect(events.length, greaterThan(0));
      expect(events.every((e) => e.category == EventCategory.tech), isTrue);
    });

    test('filters events by search query', () {
      final repo = InMemoryEventRepository();
      final events = repo.filterEvents(query: 'Resume');
      expect(events.length, greaterThan(0));
      expect(events.first.title, contains('Resume'));
    });
  });

  // Test 2: RSVP creating a ticket
  group('RSVP & Ticket Creation', () {
    test('RSVP creates a ticket through the repository', () async {
      final repo = InMemoryTicketRepository();
      final ticket = await repo.rsvpToEvent(
        userId: 'user-student-1',
        eventId: 'event-1',
      );
      expect(ticket.qrCodeValue, isNotEmpty);
      expect(ticket.status, equals(TicketStatus.valid));
    });

    test('RSVP for already registered user returns existing ticket', () async {
      final repo = InMemoryTicketRepository();
      final ticket1 = await repo.rsvpToEvent(
        userId: 'user-student-1',
        eventId: 'event-1',
      );
      final ticket2 = await repo.rsvpToEvent(
        userId: 'user-student-1',
        eventId: 'event-1',
      );
      expect(ticket2, equals(ticket1));
    });
  });

  // Test 3: Creating or editing an event
  group('Event Creation & Editing', () {
    test('creates a new event', () async {
      final repo = InMemoryEventRepository();
      final initialLength = repo.getEvents().length;
      final newEvent = Event(
        id: 'event-new',
        title: 'New Test Event',
        description: 'A test event',
        category: EventCategory.tech,
        startDateTime: DateTime(2026, 12, 5, 10, 0),
        endDateTime: DateTime(2026, 12, 5, 12, 0),
        agenda: 'Agenda item',
        speakerName: 'Test Speaker',
        speakerBio: 'Test bio',
        imageUrl: 'https://example.com',
        participantLimit: 50,
        organizerId: 'user-organizer-1',
        clubId: 'club-1',
        venueId: 'venue-1',
      );
      await repo.createEvent(newEvent);
      expect(repo.getEvents().length, equals(initialLength + 1));
    });

    test('updates an existing event using copyWith', () async {
      final repo = InMemoryEventRepository();
      final event = repo.getEventById('event-1')!;
      final updatedEvent = event.copyWith(title: 'Updated Event Title');
      await repo.updateEvent(updatedEvent);
      final updated = repo.getEventById('event-1');
      expect(updated?.title, equals('Updated Event Title'));
    });
  });

  // Test 4: Venue conflict detection
  group('Venue Conflict Detection', () {
    test('detects overlapping events at the same venue', () {
      final repo = InMemoryEventRepository();
      final events = repo.getEvents();
      final venueEvents = events.where((e) => e.venueId == 'venue-2').toList();
      expect(venueEvents.length, greaterThanOrEqualTo(2));
      final event1 = events.firstWhere((e) => e.id == 'event-1');
      final event2 = events.firstWhere((e) => e.id == 'event-2');
      final overlap = event1.startDateTime.isBefore(event2.endDateTime) &&
          event2.startDateTime.isBefore(event1.endDateTime);
      expect(overlap, isTrue);
    });
  });

  // Test 5: Navigation from Splash -> Login -> Home -> Event Details
  group('Navigation', () {
    testWidgets('navigates from Home to Event Details', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: CampusEventsApp(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Student'));
      await tester.pumpAndSettle();

      expect(find.text('Discover Events'), findsOneWidget);

      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      expect(find.text('Event Details'), findsOneWidget);
    });
  });
}
