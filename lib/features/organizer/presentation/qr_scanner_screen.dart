import 'package:flutter/material.dart';
import 'package:campus_events_clubs/features/tickets/data/in_memory_ticket_repository.dart';
import 'package:campus_events_clubs/core/data/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// QR code scanner screen for organizers to verify attendee tickets.
class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketRepository = ref.read(ticketRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('QR Ticket Scanner')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter Ticket QR Code:'),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                hintText: 'e.g., CAMPUS-EVT-event-1-user-student-1-001',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                // Validate QR code in real-time
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (context.mounted) {
                  final qrCode = 'CAMPUS-EVT-event-1-user-student-1-001'; // Sample code
                  final ticket = await ticketRepository.checkInTicket(qrCode);
                  if (ticket != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Ticket checked in! Status: '),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid ticket QR code'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }
              },
              child: const Text('Verify Ticket'),
            ),
            const SizedBox(height: 16),
            const Text('Or select from sample tickets:'),
            const SizedBox(height: 8),
            ...ticketRepository.getTicketsForUser('user-student-1').map((ticket) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ElevatedButton(
                onPressed: () async {
                  if (context.mounted) {
                    final checkedTicket = await ticketRepository.checkInTicket(ticket.qrCodeValue);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Ticket \ checked in'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Text('QR: '),
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }
}
