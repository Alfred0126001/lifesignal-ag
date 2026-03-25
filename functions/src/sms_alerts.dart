class SmsAlertPayload {
  const SmsAlertPayload({
    required this.userId,
    required this.activityLogId,
    required this.phoneNumbers,
    required this.message,
  });

  final String userId;
  final String activityLogId;
  final List<String> phoneNumbers;
  final String message;
}

abstract class SmsAlertsFunction {
  Future<void> triggerEscalationSms(SmsAlertPayload payload);
}

class StubSmsAlertsFunction implements SmsAlertsFunction {
  const StubSmsAlertsFunction();

  @override
  Future<void> triggerEscalationSms(SmsAlertPayload payload) async {}
}
