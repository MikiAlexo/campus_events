import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Home screen for discovering and filtering campus events.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Events'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search field
            _SearchField(),

            const SizedBox(height: 16),

            // Category chips
            _CategoryChips(),

            const SizedBox(height: 16),

            // Events list
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => _EventCard(
                  title: 'Flutter and Dart Workshop',
                  subtitle: 'Tech • Main Auditorium',
                  onTap: () => context.push('/events/event-1'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search events...',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => controller.clear(),
          ),
        ),
      ),
    );
  }
}

class _CategoryChips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: [
        _Chip(label: 'Tech', colorScheme: colorScheme),
        _Chip(label: 'Social', colorScheme: colorScheme),
        _Chip(label: 'Career', colorScheme: colorScheme),
        _Chip(label: 'Arts', colorScheme: colorScheme),
        _Chip(label: 'Sports', colorScheme: colorScheme),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final ColorScheme colorScheme;

  const _Chip({required this.label, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: false,
      onSelected: (_) {},
      labelPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: colorScheme.surface,
      selectedColor: colorScheme.primary,
      labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
    );
  }
}

class _EventCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _EventCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(Icons.devices,
            color: Theme.of(context).colorScheme.primary),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}