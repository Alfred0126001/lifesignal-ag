abstract class SensorCheckInAdapter {
  Future<bool> isSupported();

  Future<bool> verifyCheckInSignal();
}

class StubSensorCheckInAdapter implements SensorCheckInAdapter {
  const StubSensorCheckInAdapter();

  @override
  Future<bool> isSupported() async => false;

  @override
  Future<bool> verifyCheckInSignal() async => false;
}
