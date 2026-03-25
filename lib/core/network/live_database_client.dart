abstract class LiveDatabaseClient {
  Future<Map<String, dynamic>?> getDocument({
    required String path,
  });

  Future<void> setDocument({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<void> updateDocument({
    required String path,
    required Map<String, dynamic> data,
  });
}

class StubLiveDatabaseClient implements LiveDatabaseClient {
  const StubLiveDatabaseClient();

  @override
  Future<Map<String, dynamic>?> getDocument({
    required String path,
  }) async => null;

  @override
  Future<void> setDocument({
    required String path,
    required Map<String, dynamic> data,
  }) async {}

  @override
  Future<void> updateDocument({
    required String path,
    required Map<String, dynamic> data,
  }) async {}
}
