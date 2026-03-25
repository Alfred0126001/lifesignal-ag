abstract class VoiceCheckInAdapter {
  Future<bool> isSupported();

  Future<bool> verifyVoiceCheckIn();
}

class StubVoiceCheckInAdapter implements VoiceCheckInAdapter {
  const StubVoiceCheckInAdapter();

  @override
  Future<bool> isSupported() async => false;

  @override
  Future<bool> verifyVoiceCheckIn() async => false;
}
