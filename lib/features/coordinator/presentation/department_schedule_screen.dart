import 'package:flutter/material.dart';

/// Department coordinator view for spotting venue scheduling conflicts.
class DepartmentScheduleScreen extends StatelessWidget {
  const DepartmentScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Department Schedule')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('Department Schedule Overview Screen (Milestone 1 stub)'),
      ),
    );
  }
}
