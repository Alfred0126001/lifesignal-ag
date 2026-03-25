import '../../../core/network/live_database_client.dart';

abstract class GroupsRepository {
  Future<void> createGroup({
    required String groupId,
    required String ownerId,
    required String name,
    required List<String> memberIds,
  });
}

class StubGroupsRepository implements GroupsRepository {
  const StubGroupsRepository(this._databaseClient);

  final LiveDatabaseClient _databaseClient;

  @override
  Future<void> createGroup({
    required String groupId,
    required String ownerId,
    required String name,
    required List<String> memberIds,
  }) async {
    await _databaseClient.setDocument(
      path: 'groups/$groupId',
      data: {
        'ownerId': ownerId,
        'name': name,
        'memberIds': memberIds,
      },
    );
  }
}
