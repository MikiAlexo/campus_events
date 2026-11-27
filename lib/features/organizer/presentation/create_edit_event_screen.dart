import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:campus_events_clubs/core/data/repository_providers.dart';
import 'package:campus_events_clubs/features/events/domain/event.dart';

/// Form screen for creating a new event or editing an existing one.
class CreateEditEventScreen extends ConsumerWidget {
  const CreateEditEventScreen({this.eventId, super.key});

  final String? eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventRepository = ref.read(eventRepositoryProvider);
    final isEditing = eventId != null;
    final event = isEditing ? eventRepository.getEventById(eventId!) : null;

    final titleController = TextEditingController(text: event?.title ?? '');
    final descriptionController =
        TextEditingController(text: event?.description ?? '');
    final agendaController = TextEditingController(text: event?.agenda ?? '');
    final speakerNameController =
        TextEditingController(text: event?.speakerName ?? '');
    final speakerBioController =
        TextEditingController(text: event?.speakerBio ?? '');
    final participantLimitController = TextEditingController(
      text: event?.participantLimit.toString() ?? '',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Event' : 'Create Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: agendaController,
                decoration: const InputDecoration(labelText: 'Agenda'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: speakerNameController,
                decoration: const InputDecoration(labelText: 'Speaker Name'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: speakerBioController,
                decoration: const InputDecoration(labelText: 'Speaker Bio'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: participantLimitController,
                decoration:
                    const InputDecoration(labelText: 'Participant Limit'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final newEvent = Event(
                    id: eventId ??
                        DateTime.now().millisecondsSinceEpoch.toString(),
                    title: titleController.text,
                    description: descriptionController.text,
                    category: isEditing && event != null
                        ? event.category
                        : EventCategory.tech,
                    startDateTime: isEditing && event != null
                        ? event.startDateTime
                        : DateTime.now(),
                    endDateTime: isEditing && event != null
                        ? event.endDateTime
                        : DateTime.now().add(const Duration(hours: 1)),
                    agenda: agendaController.text,
                    speakerName: speakerNameController.text,
                    speakerBio: speakerBioController.text,
                    imageUrl: event?.imageUrl ?? '',
                    participantLimit:
                        int.tryParse(participantLimitController.text) ?? 50,
                    organizerId: 'user-organizer-1',
                    clubId: isEditing && event != null ? event.clubId : 'club-1',
                    venueId:
                        isEditing && event != null ? event.venueId : 'venue-1',
                  );

                  if (isEditing) {
                    await eventRepository.updateEvent(newEvent);
                  } else {
                    await eventRepository.createEvent(newEvent);
                  }

                  if (context.mounted) {
                    context.go('/organizer');
                  }
                },
                child: Text(isEditing ? 'Update Event' : 'Create Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
