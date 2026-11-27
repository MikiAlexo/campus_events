import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:campus_events_clubs/core/router/app_router.dart';
import 'package:campus_events_clubs/core/theme/app_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: CampusEventsApp(),
    ),
  );
}

/// Root application widget for Campus Events and Clubs.
class CampusEventsApp extends StatelessWidget {
  const CampusEventsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Campus Events & Clubs',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
