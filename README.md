# LifeSignal

Phase 1: Project Setup & Architecture

## Proposed project structure (Flutter)

```text
lib/
  app/
    app.dart
    router.dart
    theme.dart
  core/
    constants/
    error/
    utils/
  features/
    auth/
      data/
      domain/
      presentation/
    check_in/
      data/
      domain/
      presentation/
    friends/
      data/
      domain/
      presentation/
    groups/
      data/
      domain/
      presentation/
    profile/
      data/
      domain/
      presentation/
  shared/
    widgets/
    models/
```

## Firestore schema (initial)

- `users/{userId}`
  - `fullName`, `phone`, `email`
  - `checkInTime`, `gracePeriodMinutes`
  - `sensorCheckInEnabled`, `voiceCheckInEnabled`
  - `pushNotificationsEnabled`, `smsAlertsEnabled`
  - `emergencyContacts` (array of contact objects)
  - `lastKnownLocation` (GeoPoint)
- `users/{userId}/activityLogs/{logId}`
  - `status` (`SAFE`, `MISSED`, `ESCALATED`)
  - `checkInMethod` (`MANUAL`, `VOICE`, `SENSOR`)
  - `createdAt`, `checkedInAt`
  - `location` (GeoPoint, optional)
- `users/{userId}/friends/{friendUserId}`
  - `status` (`PENDING`, `ACCEPTED`, `BLOCKED`)
  - `createdAt`, `updatedAt`
- `groups/{groupId}`
  - `name`, `ownerId`
  - `memberIds` (array)
  - `createdAt`, `updatedAt`
- `groups/{groupId}/reminders/{reminderId}`
  - `sentBy`, `message`, `createdAt`

## State management approach

- Use `Riverpod` for app-wide state and dependency injection.
- Keep a clean split:
  - **Presentation**: widgets + view models/providers
  - **Domain**: entities + use cases
  - **Data**: Firebase repositories and DTO mapping
- Use stream providers for real-time Firestore-backed UI (friends status, group safety, activity feed).
- Keep check-in and escalation logic in domain use-cases to make behavior testable.

## Phase 2: UX & Feature Flows (Approved)

Approved scope for implementation:

- Authentication UX (sign in/sign up/reset password) and profile onboarding.
- Check-in setup UI (time, grace period, notification preferences).
- Friends and groups core flows (add/manage contacts, create/manage groups).
- Activity timeline and status presentation for `SAFE`, `MISSED`, and `ESCALATED`.

## Phase 3: Core Logic & Hardware (Approved)

Approved scope for implementation:

- Check-in core logic and state transitions.
- Grace period countdown handling after a missed check-in.
- Background timers/scheduling for check-in windows and escalation triggers.
- GPS fetching for `lastKnownLocation` and check-in event context.
- Sensor and voice API integrations for alternative check-in methods.

### Phase 3 scaffolding started

- `lib/features/check_in/domain/check_in_state_machine.dart`
- `lib/features/check_in/data/timer_service.dart`
- `lib/features/check_in/data/gps_provider.dart`
- `lib/features/check_in/data/sensor_check_in_adapter.dart`
- `lib/features/check_in/data/voice_check_in_adapter.dart`
