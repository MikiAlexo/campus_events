import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Displays the user's registered events and digital QR tickets.
class MyTicketsScreen extends StatelessWidget {
  const MyTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tickets')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Tickets Screen (Milestone 1 stub)'),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () => context.push('/tickets/offline'),
              icon: const Icon(Icons.offline_pin),
              label: const Text('View Offline Tickets'),
            ),
          ],
        ),
      ),
    );
  }
}
