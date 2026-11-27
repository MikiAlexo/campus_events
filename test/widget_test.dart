import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:campus_events_clubs/main.dart';

void main() {
  testWidgets('App renders SplashScreen on launch', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: CampusEventsApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Campus Events & Clubs'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
