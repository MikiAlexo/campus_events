# AI usage disclosure

## Tools used

| Tool | Version / model | Used for |
|---|---|---|
| Gemini (Antigravity) | Gemini | Scaffolding `freezed` models, repository interfaces, `go_router` setup, fixing analyzer errors, and drafting `MILESTONE.md` |
| AI coding assistant | — | Assisting with screen UI drafts and unit/widget test cases |

## What was generated and where

| File / function | Member | AI-use level | What the tool produced | What we changed | How we verified it |
|---|---|---|---|---|---|
| `lib/features/*/domain/*.dart` (6 `freezed` models + 4 repository interfaces) | Mikiyas Alemayehu | 3 (Draft and verify) | Initial `freezed` model classes and repository interfaces | Aligned fields with `PROPOSAL.md` and ran `build_runner` | Ran `dart run build_runner build` and `flutter analyze --fatal-infos` |
| `lib/core/router/app_router.dart`, `lib/core/theme/app_theme.dart`, `lib/core/widgets/app_shell.dart` | Mikiyas Alemayehu | 3 (Draft and verify) | `GoRouter` routes, Material 3 theme, and bottom navigation shell | Adjusted route paths and verified all 14 screens are reachable | Ran `flutter analyze --fatal-infos` and `flutter test` |
| `lib/features/*/presentation/*.dart` (analyzer fixes) | Mikiyas Alemayehu | 3 (Draft and verify) | Fixed `ConsumerWidget` overrides, `ref.read` usage, string interpolations, and lints | Reviewed each screen and removed unused `login_screen_new.dart` | Ran `flutter analyze --fatal-infos` (0 issues) and `flutter test` (8/8 passed) |
| Auth, Discovery, Event Details, AI Summary, and Profile screens | Nahom Desta | 3 (Draft and verify) | Screen layout and widget drafts | Verified against design requirements | Verified manually and with `flutter analyze --fatal-infos` |
| In-memory repositories and Department Schedule screen | Yosef Ayele | 3 (Draft and verify) | Initial in-memory repository implementations and schedule screen | Seeded campus venues, overlapping events, and wired Riverpod providers | `flutter analyze --fatal-infos` and `flutter test` |
| Tickets, Organizer, Map screens, and `test/widget_test.dart` | Yonathan Markos | 3 (Draft and verify) | Initial screen drafts and unit/widget tests | Connected to repository providers and updated navigation test | `flutter test` (8/8 passed) |

## Which tasks did we do without an assistant first?

We designed the project problem statement, user stories, 14-screen list, entity-relationship data model, and milestone plan ourselves in `PROPOSAL.md` before writing code.

## Problems found in AI output

- Some screen widgets used `StatelessWidget` with `WidgetRef ref` in `build(...)` or `context.read(...)` instead of `ConsumerWidget` and `ref.read(...)`, and imported non-existent `event_category.dart` / `ticket_status.dart` files instead of `event.dart` / `ticket.dart`. We caught and fixed these via `flutter analyze --fatal-infos`.

## Individual declaration

| Name | I wrote or reviewed and can explain these files | I entered no passwords, keys or personal data into an AI tool (yes / no) | Signature |
|---|---|---|---|
| Mikiyas Alemayehu | `lib/main.dart`, `lib/core/*`, `lib/features/*/domain/*.dart`, `MILESTONE.md` | yes | Mikiyas Alemayehu |
| Yosef Ayele | `lib/features/*/data/in_memory_*.dart`, `lib/core/data/repository_providers.dart`, `lib/features/coordinator/presentation/department_schedule_screen.dart` | yes | Yosef Ayele |
| Nahom Desta | `lib/features/auth/presentation/*`, `lib/features/events/presentation/*`, `lib/features/profile/presentation/*` | yes | Nahom Desta |
| Yonathan Markos | `lib/features/tickets/presentation/*`, `lib/features/organizer/presentation/*`, `lib/features/map/presentation/*`, `test/widget_test.dart` | yes | Yonathan Markos |

Date: 2026-11-27
