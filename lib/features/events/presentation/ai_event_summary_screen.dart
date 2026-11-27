import 'package:flutter/material.dart';

/// Displays AI-generated event takeaways and relevance tags.
class AiEventSummaryScreen extends StatelessWidget {
  const AiEventSummaryScreen({required this.eventId, super.key});

  final String eventId;

  @override
  Widget build(BuildContext context) {
    final List<String> takeaways = [
      'Key discussions focused on practical implementation of Flutter concepts',
      'Attendees reported high engagement during the hands-on workshop sessions',
      'The event provided valuable networking opportunities with industry professionals',
      'Feedback indicates strong interest in future cross-platform app development events',
    ];

    final List<String> tags = [
      'Flutter',
      'Dart',
      'Cross-platform',
      'Mobile Development',
      'UI/UX',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('AI Event Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AI-Generated Takeaways:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E56A0),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: takeaways.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            takeaways[index],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Topical Relevance:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E56A0),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  backgroundColor: const Color(0xFFE3F2FD),
                  labelStyle: const TextStyle(
                    color: Color(0xFF1E56A0),
                    fontSize: 12,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
