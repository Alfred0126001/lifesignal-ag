import '../../../core/network/live_database_client.dart';

abstract class FriendsRepository {
  Future<void> addFriend({
    required String userId,
    required String friendUserId,
  });
}

class StubFriendsRepository implements FriendsRepository {
  const StubFriendsRepository(this._databaseClient);

  final LiveDatabaseClient _databaseClient;

  @override
  Future<void> addFriend({
    required String userId,
    required String friendUserId,
  }) async {
    final now = DateTime.now().toIso8601String();

    await _databaseClient.setDocument(
      path: 'users/$userId/friends/$friendUserId',
      data: {
        'status': 'PENDING',
        'createdAt': now,
        'updatedAt': now,
      },
    );
  }
}
