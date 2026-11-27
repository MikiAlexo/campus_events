import 'package:flutter/material.dart';

/// Displays cached digital tickets for offline venue check-in.
class OfflineTicketsScreen extends StatelessWidget {
  const OfflineTicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offline Tickets')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Offline Tickets Screen (Milestone 1 stub)'),
      ),
    );
  }
}
