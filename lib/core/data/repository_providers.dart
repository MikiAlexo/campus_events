import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:campus_events_clubs/features/auth/domain/auth_repository.dart';
import 'package:campus_events_clubs/features/coordinator/domain/schedule_repository.dart';
import 'package:campus_events_clubs/features/events/domain/event_repository.dart';
import 'package:campus_events_clubs/features/tickets/domain/ticket_repository.dart';

/// Repository provider stubs overridden once in-memory implementations are added.
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => throw UnimplementedError('AuthRepository not implemented yet'),
);

final eventRepositoryProvider = Provider<EventRepository>(
  (ref) => throw UnimplementedError('EventRepository not implemented yet'),
);

final ticketRepositoryProvider = Provider<TicketRepository>(
  (ref) => throw UnimplementedError('TicketRepository not implemented yet'),
);

final scheduleRepositoryProvider = Provider<ScheduleRepository>(
  (ref) => throw UnimplementedError('ScheduleRepository not implemented yet'),
);
