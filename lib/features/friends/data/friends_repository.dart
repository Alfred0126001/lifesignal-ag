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
    await _databaseClient.setDocument(
      path: 'users/$userId/friends/$friendUserId',
      data: {
        'status': 'PENDING',
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      },
    );
  }
}
