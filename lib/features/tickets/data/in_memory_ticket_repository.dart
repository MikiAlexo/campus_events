import 'package:campus_events_clubs/features/tickets/domain/registration.dart';
import 'package:campus_events_clubs/features/tickets/domain/ticket.dart';
import 'package:campus_events_clubs/features/tickets/domain/ticket_repository.dart';

// This class stores registrations and tickets in simple lists.
class InMemoryTicketRepository implements TicketRepository {
  // Sample registrations — the student has already RSVP'd to 3 events
  final List<Registration> _registrations = [
    Registration(
      id: 'reg-1',
      userId: 'user-student-1',
      eventId: 'event-1',
      registeredAt: DateTime(2024, 11, 20, 10, 0),
      status: RegistrationStatus.confirmed,
    ),
    Registration(
      id: 'reg-2',
      userId: 'user-student-1',
      eventId: 'event-4',
      registeredAt: DateTime(2024, 11, 21, 14, 30),
      status: RegistrationStatus.confirmed,
    ),
    Registration(
      id: 'reg-3',
      userId: 'user-student-1',
      eventId: 'event-6',
      registeredAt: DateTime(2024, 11, 22, 9, 0),
      status: RegistrationStatus.confirmed,
    ),
  ];

  // One ticket per registration (QR code is just a simple string)
  final List<Ticket> _tickets = [
    Ticket(
      id: 'ticket-1',
      registrationId: 'reg-1',
      qrCodeValue: 'CAMPUS-EVT-event-1-user-student-1-001',
      issuedAt: DateTime(2024, 11, 20, 10, 1),
      status: TicketStatus.valid,
    ),
    Ticket(
      id: 'ticket-2',
      registrationId: 'reg-2',
      qrCodeValue: 'CAMPUS-EVT-event-4-user-student-1-002',
      issuedAt: DateTime(2024, 11, 21, 14, 31),
      status: TicketStatus.valid,
    ),
    Ticket(
      id: 'ticket-3',
      registrationId: 'reg-3',
      qrCodeValue: 'CAMPUS-EVT-event-6-user-student-1-003',
      issuedAt: DateTime(2024, 11, 22, 9, 1),
      status: TicketStatus.valid,
    ),
  ];

  // Used to generate unique IDs for new registrations and tickets
  int _nextIdNumber = 100;

  // ── TicketRepository methods ──────────────────────────────────────────────

  @override
  List<Registration> getRegistrationsForUser(String userId) {
    final List<Registration> result = [];
    for (final Registration reg in _registrations) {
      if (reg.userId == userId) {
        result.add(reg);
      }
    }
    return result;
  }

  @override
  List<Ticket> getTicketsForUser(String userId) {
    // First collect all registration IDs that belong to this user
    final List<String> userRegIds = [];
    for (final Registration reg in _registrations) {
      if (reg.userId == userId) {
        userRegIds.add(reg.id);
      }
    }

    // Then find all tickets that match those registration IDs
    final List<Ticket> result = [];
    for (final Ticket ticket in _tickets) {
      if (userRegIds.contains(ticket.registrationId)) {
        result.add(ticket);
      }
    }
    return result;
  }

  @override
  Future<Ticket> rsvpToEvent({
    required String userId,
    required String eventId,
  }) async {
    // Check if the user already registered for this event
    for (final Registration reg in _registrations) {
      if (reg.userId == userId && reg.eventId == eventId) {
        // Already registered — just return the existing ticket
        for (final Ticket ticket in _tickets) {
          if (ticket.registrationId == reg.id) {
            return ticket;
          }
        }
      }
    }

    // Create a new registration
    _nextIdNumber++;
    final String newRegId = 'reg-$_nextIdNumber';
    final String newTicketId = 'ticket-$_nextIdNumber';

    final Registration newRegistration = Registration(
      id: newRegId,
      userId: userId,
      eventId: eventId,
      registeredAt: DateTime.now(),
      status: RegistrationStatus.confirmed,
    );
    _registrations.add(newRegistration);

    // Create a new ticket for that registration
    final Ticket newTicket = Ticket(
      id: newTicketId,
      registrationId: newRegId,
      qrCodeValue: 'CAMPUS-EVT-$eventId-$userId-$_nextIdNumber',
      issuedAt: DateTime.now(),
      status: TicketStatus.valid,
    );
    _tickets.add(newTicket);

    return newTicket;
  }

  @override
  Future<Ticket?> checkInTicket(String qrCodeValue) async {
    // Find the ticket that has this QR code
    for (int i = 0; i < _tickets.length; i++) {
      if (_tickets[i].qrCodeValue == qrCodeValue) {
        final Ticket ticket = _tickets[i];

        // If already checked in, just return it as-is
        if (ticket.status == TicketStatus.checkedIn) {
          return ticket;
        }

        // Mark it as checked in
        final Ticket updatedTicket = ticket.copyWith(
          status: TicketStatus.checkedIn,
          checkedInAt: DateTime.now(),
        );
        _tickets[i] = updatedTicket;
        return updatedTicket;
      }
    }

    // No ticket found with that QR code
    return null;
  }
}
