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
