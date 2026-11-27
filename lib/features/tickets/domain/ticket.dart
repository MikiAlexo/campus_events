import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket.freezed.dart';

/// Admission status of a digital event ticket.
enum TicketStatus {
  valid,
  checkedIn,
  cancelled,
}

/// Represents a digital QR-code ticket issued for a registration.
@freezed
abstract class Ticket with _$Ticket {
  const factory Ticket({
    required String id,
    required String registrationId,
    required String qrCodeValue,
    required DateTime issuedAt,
    required TicketStatus status,
    DateTime? checkedInAt,
  }) = _Ticket;
}
