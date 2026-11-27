import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:campus_events_clubs/core/data/repository_providers.dart';
import 'package:campus_events_clubs/features/tickets/domain/ticket.dart';

/// Displays cached digital tickets for offline venue check-in.
class OfflineTicketsScreen extends ConsumerWidget {
  const OfflineTicketsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketRepository = ref.read(ticketRepositoryProvider);
    final tickets = ticketRepository.getTicketsForUser('user-student-1');

    return Scaffold(
      appBar: AppBar(title: const Text('Offline Tickets')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tickets Available Offline'),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  final ticket = tickets[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const Icon(Icons.qr_code, color: Colors.green),
                      title: Text('Ticket ${ticket.id}'),
                      subtitle: Text('QR: ${ticket.qrCodeValue}'),
                      trailing: Icon(
                        ticket.status == TicketStatus.checkedIn
                            ? Icons.check_circle
                            : Icons.qr_code,
                        color: ticket.status == TicketStatus.checkedIn
                            ? Colors.green
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
