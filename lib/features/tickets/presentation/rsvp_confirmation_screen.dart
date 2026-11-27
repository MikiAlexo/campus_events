import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:campus_events_clubs/features/tickets/data/in_memory_ticket_repository.dart';
import 'package:campus_events_clubs/core/data/repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Confirms a student's RSVP and links to their digital ticket.
class RsvpConfirmationScreen extends StatelessWidget {
  const RsvpConfirmationScreen({required this.eventId, super.key});

  final String eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticketRepository = ref.read(ticketRepositoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('RSVP Confirmed')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, size: 64, color: Colors.green),
              const SizedBox(height: 16),
              const Text('Processing RSVP...'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final ticket = await ticketRepository.rsvpToEvent(
                    userId: 'user-student-1',
                    eventId: eventId,
                  );
                  if (ticket != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('RSVP successful! Ticket QR: '),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('RSVP failed'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: const Text('Complete RSVP'),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.go('/tickets'),
                child: const Text('View My Tickets'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
