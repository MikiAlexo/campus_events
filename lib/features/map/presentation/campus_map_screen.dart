import 'package:flutter/material.dart';

/// Interactive campus map screen showing event venue markers.
class CampusMapScreen extends StatelessWidget {
  const CampusMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Map')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Campus Map Screen (Milestone 1 stub)'),
      ),
    );
  }
}
