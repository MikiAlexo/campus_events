import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:campus_events_clubs/core/data/repository_providers.dart';

/// QR code scanner screen for organizers to verify attendee tickets.
class QrScannerScreen extends ConsumerWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketRepository = ref.read(ticketRepositoryProvider);
    final controller = TextEditingController(
      text: 'CAMPUS-EVT-event-1-user-student-1-001',
    );

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
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'e.g., CAMPUS-EVT-event-1-user-student-1-001',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final ticket =
                    await ticketRepository.checkInTicket(controller.text.trim());
                if (!context.mounted) return;
                if (ticket != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Ticket checked in! Status: ${ticket.status.name}',
                      ),
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
              },
              child: const Text('Verify Ticket'),
            ),
            const SizedBox(height: 16),
            const Text('Or select from sample tickets:'),
            const SizedBox(height: 8),
            ...ticketRepository.getTicketsForUser('user-student-1').map(
                  (ticket) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ElevatedButton(
                      onPressed: () async {
                        final checkedTicket = await ticketRepository
                            .checkInTicket(ticket.qrCodeValue);
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              checkedTicket != null
                                  ? 'Ticket ${checkedTicket.qrCodeValue} checked in'
                                  : 'Ticket not found',
                            ),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Text('QR: ${ticket.qrCodeValue}'),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
