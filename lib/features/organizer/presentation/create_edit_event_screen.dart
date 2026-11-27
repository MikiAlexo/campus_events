import 'package:flutter/material.dart';

/// Form screen for creating a new event or editing an existing one.
class CreateEditEventScreen extends StatelessWidget {
  const CreateEditEventScreen({this.eventId, super.key});

  final String? eventId;

  @override
  Widget build(BuildContext context) {
    final isEditing = eventId != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Event' : 'Create Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          isEditing
              ? 'Edit Event Screen for $eventId (Milestone 1 stub)'
              : 'Create Event Screen (Milestone 1 stub)',
        ),
      ),
    );
  }
}
