import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Login and registration screen (stubbed for Milestone 1).
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In / Register')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Login / Registration Screen (Milestone 1 stub)'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.go('/events'),
                child: const Text('Continue to Events'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
