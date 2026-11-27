import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Confirms a student's RSVP and links to their digital ticket.
class RsvpConfirmationScreen extends StatelessWidget {
  const RsvpConfirmationScreen({required this.eventId, super.key});

  final String eventId;

  @override
  Widget build(BuildContext context) {
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
              Text('RSVP confirmed for $eventId'),
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
