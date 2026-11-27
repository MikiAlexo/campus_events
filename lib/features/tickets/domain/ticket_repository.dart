import 'package:campus_events_clubs/features/tickets/domain/registration.dart';
import 'package:campus_events_clubs/features/tickets/domain/ticket.dart';

/// Contract for event RSVPs, digital tickets, and QR check-in.
abstract interface class TicketRepository {
  List<Registration> getRegistrationsForUser(String userId);
  List<Ticket> getTicketsForUser(String userId);
  Future<Ticket> rsvpToEvent({
    required String userId,
    required String eventId,
  });
  Future<Ticket?> checkInTicket(String qrCodeValue);
}
