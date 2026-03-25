enum CheckInStatus {
  safe,
  missed,
  gracePeriod,
  escalated,
}

enum CheckInEvent {
  checkInSucceeded,
  checkInMissed,
  gracePeriodExpired,
  escalationAcknowledged,
}

class CheckInStateMachine {
  const CheckInStateMachine();

  CheckInStatus transition({
    required CheckInStatus current,
    required CheckInEvent event,
  }) {
    switch (current) {
      case CheckInStatus.safe:
        if (event == CheckInEvent.checkInMissed) {
          return CheckInStatus.missed;
        }
        return CheckInStatus.safe;
      case CheckInStatus.missed:
        if (event == CheckInEvent.checkInSucceeded) {
          return CheckInStatus.safe;
        }
        if (event == CheckInEvent.gracePeriodExpired) {
          return CheckInStatus.escalated;
        }
        return CheckInStatus.missed;
      case CheckInStatus.gracePeriod:
        if (event == CheckInEvent.checkInSucceeded) {
          return CheckInStatus.safe;
        }
        if (event == CheckInEvent.gracePeriodExpired) {
          return CheckInStatus.escalated;
        }
        return CheckInStatus.gracePeriod;
      case CheckInStatus.escalated:
        if (event == CheckInEvent.escalationAcknowledged) {
          return CheckInStatus.safe;
        }
        return CheckInStatus.escalated;
    }
  }
}
