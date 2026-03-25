class GeoLocation {
  const GeoLocation({
    required this.latitude,
    required this.longitude,
    this.capturedAt,
  });

  final double latitude;
  final double longitude;
  final DateTime? capturedAt;
}

abstract class GpsProvider {
  Future<GeoLocation?> getLastKnownLocation();
}

class StubGpsProvider implements GpsProvider {
  const StubGpsProvider();

  @override
  Future<GeoLocation?> getLastKnownLocation() async => null;
}
