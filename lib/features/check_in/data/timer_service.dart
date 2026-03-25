abstract class TimerService {
  void scheduleCheckInWindow({
    required DateTime scheduledAt,
    required void Function() onDue,
  });

  void scheduleGracePeriod({
    required Duration duration,
    required void Function() onExpired,
  });

  void cancelAll();
}

class StubTimerService implements TimerService {
  const StubTimerService();

  @override
  void scheduleCheckInWindow({
    required DateTime scheduledAt,
    required void Function() onDue,
  }) {}

  @override
  void scheduleGracePeriod({
    required Duration duration,
    required void Function() onExpired,
  }) {}

  @override
  void cancelAll() {}
}
