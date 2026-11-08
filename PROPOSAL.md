# Project proposal

**Due:** Sunday 8 November 2026 · **Submit:** commit it as `PROPOSAL.md` in the root
of your group's repository and tag that commit `proposal`

Replace every *italic* instruction with your own text. Keep the whole
proposal under four pages.

---

## 1. Title and one-sentence description

Campus Events and Clubs: An app that helps university students with discovering college activities so that they can engage with campus communities.

## 2. Group

*Student IDs, emails and GitHub usernames are in `project.yaml`; do not
repeat them here.*

| Name | Role |
|---|---|
| Mikiyas Alemayehu | Team Lead & Backend |
| Yosef Ayele | Backend & Testing |
| Nahom Desta | UI/UX |
| Yonathan Markos | UI/UX & Testing |

*Roles are starting points; everyone writes code in every layer.*

## 3. The problem

University campuses host academic seminars, hackathons, cultrual festivals and sports comeptitions. Despite this, a large portion of students remain uninformed and disconnected from campus life. Information is framgmented across telegram channels, unofficial social media accounts and paper posters.

Currently, students track campus activities through word of mouth or telegram channels.Club executives struggle just as much, as they must print physical flyers and have no reliable channel to announce last-minute room or schedule changes.

A dedicated mobile app solves this by consolidating campus life into a single pocket dashboard allowing students to track events and activities anywhere from their mobile phones.

## 4. Users

User 1: Students: undergraduate student seeking to expand their social circle and build technical or extracurricular skills.
-Wants to easily browse events by interest (tech, arts, sports), RSVP with one tap, and receive calendar reminders.
- frequency of use would be 3 to 5 times a week to check what is happening around campus.
User 2: Club Organizer: A student club leader responsible for planning workshops and tracking turnout.
-  Wants to publish new events, update venue and timing information, broadcast urgent notices, and verify attendee tickets at the door.
- Frequency of use is daily during the week leading up to an event, and heavily during event day for check-ins.
User 3:  Campus Department Coordinator: A university staff member or department administrator who reviews student activity requests and room bookings.
- Wants an overview of scheduled campus activities to prevent scheduling collisions and double-booking of shared halls.
Frequency of use is once or twice a week.

## 5. User stories

1. As a student (general attendee), I want to browse and filter upcoming campus events by category (tech, social, career, arts, and sports) so that I can quickly find activities matching my interests. (must)
2. As a student (general attendee), I want to view full event details, including the venue, schedule, club host, agenda, and speaker biography, so that I can decide whether to attend. (must)
3. As a student (general attendee), I want to RSVP for an event and receive a digital ticket with a QR code so that I can secure my entry. (must)
4. As a club organizer, I want to create, edit, and publish event listings with photos, venue tags, and participant limits so that I can attract attendees and manage event registration. (must)
5. As a student (general attendee), I want to access my saved tickets and event details offline so that I can show my pass at the venue entrance even when campus Wi-Fi is unavailable. (must)
6. As a club organizer, I want to scan student ticket QR codes using my phone camera so that I can verify tickets and track attendance quickly without using paper registration sheets. (should)
7. As a student (general attendee), I want to receive AI-generated summaries and key takeaways of lengthy event descriptions so that I can understand important information without reading the entire description. (should)
8. As a student (general attendee), I want to view event venue locations on an interactive campus map so that I can easily navigate unfamiliar campus locations. (could)

## 6. Screens

*List every screen with one line describing what it shows and which user
stories it serves. Add hand-drawn or simple digital sketches for the four
most important screens (photos of paper sketches are fine).*

| Screen | Purpose | User stories |
|---|---|---|
|Splash / Welcome Screen | Displays the application logo and introductory information when users open the app.|General navigation |
| Login / Registration Screen  |  Allows students and organizers to create accounts and securely log in.  | Supports all user stories |
| Home / Discover Events Screen | Displays upcoming and featured campus events with category filters and search functionality | 1 |
| Event Details Screen | Displays event descriptions, venue, date, schedule, host club, agenda, and speaker information. | 2, 7, 8 |
| RSVP Confirmation Screen | Allows students to register for an event and confirms successful registration. | 3 |
| My Tickets Screen | Displays registered events and their digital QR-code tickets. | 3,5 |
| Offline Tickets Screen | Provides access to previously saved tickets and event details without an internet connection. | 5 |
| Organizer Dashboard Screen | Gives club organizers an overview of their published events, registrations, and attendance. | 4, 6 |
| Create / Edit Event Screen | Allows organizers to create, edit, and publish event listings, upload photos, set venues, and define participant limits. | 4 |
| QR Code Scanner Screen | Uses the phone camera to scan and verify attendee tickets while recording attendance. | 6 |
| AI Event Summary Screen | Displays concise AI-generated event descriptions and important takeaways. | 7 |
| Campus Map Screen | Shows event venues using interactive map pins to help students navigate campus. | 8 |
| Profile / Settings Screen | Allows users to manage their profiles, preferences, notifications, and account settings. | Supports all user types |
| Department Schedule Overview Screen | Allows faculty or administrative coordinators to view scheduled campus activities and identify venue scheduling conflicts. | Department coordinator needs |
## 7. Data model

*The main entities and their fields, and how they relate. A simple
diagram or a list such as:*

```
Event: id, title, start, venue, description, organiserId
User: id, name, email, programme
Registration: userId, eventId, createdAt
```

## 8. Data sources

*Which data is stored locally (and with what: shared_preferences, drift)?
Which comes from a REST web service (one you build or find), and which
from Firebase (Auth, Firestore)? Every project needs local persistence, a
REST source and Firebase.*

## 9. Device feature and AI feature

*Every project needs one device feature (camera, location or a sensor)
**and** one AI feature (for example a summary or a suggestion). For each,
say which user story needs it. For the device feature, say which
permissions it asks for; for the AI feature, what data is sent and to
whom.*

## 10. Risks

*Three to five things that could go wrong (a third-party API might be
unavailable, a feature might need a paid service, a member has exams)
and what you will do about each.*

| Risk | Likelihood | Plan |
|---|---|---|
| | | |

## 11. Milestone plan

*Which user stories will be complete at Milestone 1 (week 6), Milestone 2
(week 10) and the final submission (week 14)? Milestone 1 should contain
all screens with navigation and in-memory state; Milestone 2 should
contain real data.*

## 12. AI-use plan

*Which AI tools, if any, does the group intend to use, and for what
(learning, generating boilerplate, reviewing code, writing tests)? See
`../syllabus/policies.md`.*

---

## How the proposal is marked (10 points)

| Criterion | Points |
|---|---|
| The problem and the users are specific, and one real person who has the problem is named | 2 |
| User stories in the given form, each marked must, should or could | 2 |
| The screens and the data model cover every "must" story | 2 |
| Local, REST and Firebase data named, and a device feature and an AI feature chosen | 2 |
| Risks and the milestone plan are realistic for four people and the course weeks | 2 |

## Approval

The instructor returns each proposal with one of these decisions and a
short written comment:

- **Approved.**
- **Approved with changes** — the changes are listed; make them before
  Milestone 1.
- **Revise and resubmit by the date given in the comment** — the group may not start
  Milestone 1 work on the parts that must be revised.
