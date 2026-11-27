import 'package:flutter/material.dart';

/// Displays AI-generated event takeaways and relevance tags.
class AiEventSummaryScreen extends StatelessWidget {
  const AiEventSummaryScreen({required this.eventId, super.key});

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Event Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'AI Event Summary for $eventId (Milestone 1 stub)',
        ),
      ),
    );
  }
}
