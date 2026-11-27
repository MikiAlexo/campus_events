# Milestone 1 — Screens, Navigation, State

**Tag:** `m1`  
**Project:** Campus Events and Clubs

---

## 1. What is done and what is not

### Done
- Feature-first project structure (`lib/core` and `lib/features/{auth,coordinator,events,map,organizer,profile,tickets}/{domain,data,presentation}`).
- All 14 proposed screens implemented and reachable through `go_router` (5-tab `NavigationBar` shell plus parameterized routes `/events/:id`, `/events/:id/rsvp-confirm`, `/events/:id/ai-summary`, `/organizer/events/:id/edit`, `/tickets/offline`, `/coordinator/schedule`, `/splash`, `/login`).
- Six immutable `freezed` domain models (`User`, `Club`, `Event`, `Venue`, `Registration`, `Ticket`) with generated `*.freezed.dart` files committed.
- Four repository interfaces (`AuthRepository`, `EventRepository`, `TicketRepository`, `ScheduleRepository`) backed by in-memory implementations and wired via Riverpod providers.
- Eight unit and widget tests covering category/search filtering, RSVP ticket creation, event creation/editing, venue conflict detection, and widget navigation.

### Not done yet (scheduled for Milestone 2 and Final)
- Local persistence (`drift`, `shared_preferences`), custom Node.js/Express REST API, and Firebase Auth/Firestore/Storage integration.
- Real camera QR scanning (`mobile_scanner`), Google Gemini AI agenda summarization, and interactive map pins.

---

## 2. Who did what

| Member | GitHub | Pull Requests Authored | Pull Requests Reviewed |
|---|---|---|---|
| Mikiyas Alemayehu | `MikiAlexo` | PR #1 (`chore/project-setup`), PR #3 (`feature/repos-providers-schedule` → `main`), PR #6 (`fix/m1-analyzer-and-docs`) | Reviewed & merged PR #4, PR #5 |
| Yosef Ayele | `joe1m2` | PR #2 (`feature/repos-providers-schedule`) | PR #5 (Approved) |
| Nahom Desta | `joyboy64209` | PR #4 (`feature/auth-and-discovery`) | PR #5 (Approved) |
| Yonathan Markos | `yonathanmark2k` | PR #5 (`feature/tickets-organizer-map`) | PR #4 (Approved) |

---

## 3. Group self-score (Mini-rubric — 10 points)

| Criterion | Max | Self-Score | Evidence |
|---|---|---|---|
| All proposed screens present and navigable | 3 | 3 | All 14 screens from `PROPOSAL.md` are implemented and reachable via `appRouter` (`go_router`) with bottom navigation and parameterized detail routes. |
| Feature-first structure; state in providers, not widgets | 2 | 2 | Code is organized under `lib/core` and `lib/features/<feature>/{domain,data,presentation}` with `freezed` models and Riverpod repository providers. |
| Tests present; analyzer and tests clean in the pasted output | 1 | 1 | `test/widget_test.dart` includes 8 passing unit and widget tests, and `flutter analyze --fatal-infos` passes with 0 issues. |
| Repository hygiene: branches, pull requests, readable history | 1 | 1 | All work was developed on feature branches and merged into `main` via merge commits with descriptive commit messages. |
| Individual oral check (recorded per member) | 3 | — | Pending TA oral check in the lab following the Milestone 1 deadline. |

---

## 4. One thing we will change before Milestone 2

We will run `flutter analyze --fatal-infos` and `flutter test` locally before opening every pull request and ensure every PR is reviewed on GitHub before merging into `main`, so compile or lint issues are caught before integration.

---

## 5. Analyzer and test output (run on final code)

### `flutter analyze --fatal-infos`
```text
Analyzing Mobile project...
No issues found! (ran in 20.0s)
```

### `flutter test`
```text
00:00 +0: loading C:/Users/VICTUS/Documents/Project Files/Mobile project/test/widget_test.dart
00:00 +0: Event Search & Category Filtering filters events by category
00:00 +1: Event Search & Category Filtering filters events by search query
00:00 +2: RSVP & Ticket Creation RSVP creates a ticket through the repository
00:00 +3: RSVP & Ticket Creation RSVP for already registered user returns existing ticket
00:00 +4: Event Creation & Editing creates a new event
00:00 +5: Event Creation & Editing updates an existing event using copyWith
00:00 +6: Venue Conflict Detection detects overlapping events at the same venue
00:00 +7: Navigation navigates from Home to Event Details
00:02 +8: All tests passed!
```
