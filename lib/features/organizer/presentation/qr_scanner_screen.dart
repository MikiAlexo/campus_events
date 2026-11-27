import 'package:flutter/material.dart';

/// QR code scanner screen for organizers to verify attendee tickets.
class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Ticket Scanner')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('QR Code Scanner Screen (Milestone 1 stub)'),
      ),
    );
  }
}
