import 'package:go_router/go_router.dart';

import 'package:campus_events_clubs/core/widgets/app_shell.dart';
import 'package:campus_events_clubs/features/auth/presentation/login_screen.dart';
import 'package:campus_events_clubs/features/auth/presentation/splash_screen.dart';
import 'package:campus_events_clubs/features/coordinator/presentation/department_schedule_screen.dart';
import 'package:campus_events_clubs/features/events/presentation/ai_event_summary_screen.dart';
import 'package:campus_events_clubs/features/events/presentation/event_details_screen.dart';
import 'package:campus_events_clubs/features/events/presentation/home_screen.dart';
import 'package:campus_events_clubs/features/map/presentation/campus_map_screen.dart';
import 'package:campus_events_clubs/features/organizer/presentation/create_edit_event_screen.dart';
import 'package:campus_events_clubs/features/organizer/presentation/organizer_dashboard_screen.dart';
import 'package:campus_events_clubs/features/organizer/presentation/qr_scanner_screen.dart';
import 'package:campus_events_clubs/features/profile/presentation/profile_screen.dart';
import 'package:campus_events_clubs/features/tickets/presentation/my_tickets_screen.dart';
import 'package:campus_events_clubs/features/tickets/presentation/offline_tickets_screen.dart';
import 'package:campus_events_clubs/features/tickets/presentation/rsvp_confirmation_screen.dart';

/// Central GoRouter configuration covering all 14 proposed screens.
final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/coordinator/schedule',
      builder: (context, state) => const DepartmentScheduleScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/events',
              builder: (context, state) => const HomeScreen(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final eventId = state.pathParameters['id']!;
                    return EventDetailsScreen(eventId: eventId);
                  },
                  routes: [
                    GoRoute(
                      path: 'rsvp-confirm',
                      builder: (context, state) {
                        final eventId = state.pathParameters['id']!;
                        return RsvpConfirmationScreen(eventId: eventId);
                      },
                    ),
                    GoRoute(
                      path: 'ai-summary',
                      builder: (context, state) {
                        final eventId = state.pathParameters['id']!;
                        return AiEventSummaryScreen(eventId: eventId);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tickets',
              builder: (context, state) => const MyTicketsScreen(),
              routes: [
                GoRoute(
                  path: 'offline',
                  builder: (context, state) => const OfflineTicketsScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/organizer',
              builder: (context, state) => const OrganizerDashboardScreen(),
              routes: [
                GoRoute(
                  path: 'events/new',
                  builder: (context, state) => const CreateEditEventScreen(),
                ),
                GoRoute(
                  path: 'events/:id/edit',
                  builder: (context, state) {
                    final eventId = state.pathParameters['id']!;
                    return CreateEditEventScreen(eventId: eventId);
                  },
                ),
                GoRoute(
                  path: 'scanner',
                  builder: (context, state) => const QrScannerScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/map',
              builder: (context, state) => const CampusMapScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
