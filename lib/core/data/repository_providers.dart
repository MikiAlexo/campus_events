import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:campus_events_clubs/features/auth/data/in_memory_auth_repository.dart';
import 'package:campus_events_clubs/features/auth/domain/auth_repository.dart';
import 'package:campus_events_clubs/features/coordinator/data/in_memory_schedule_repository.dart';
import 'package:campus_events_clubs/features/coordinator/domain/schedule_repository.dart';
import 'package:campus_events_clubs/features/events/data/in_memory_event_repository.dart';
import 'package:campus_events_clubs/features/events/domain/event_repository.dart';
import 'package:campus_events_clubs/features/tickets/data/in_memory_ticket_repository.dart';
import 'package:campus_events_clubs/features/tickets/domain/ticket_repository.dart';

/// Repository providers wired to in-memory implementations for Milestone 1.
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => InMemoryAuthRepository(),
);

final eventRepositoryProvider = Provider<EventRepository>(
  (ref) => InMemoryEventRepository(),
);

final ticketRepositoryProvider = Provider<TicketRepository>(
  (ref) => InMemoryTicketRepository(),
);

final scheduleRepositoryProvider = Provider<ScheduleRepository>(
  (ref) => InMemoryScheduleRepository(
    eventRepository: ref.watch(eventRepositoryProvider),
  ),
);
