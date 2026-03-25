abstract class AuthService {
  Future<String?> signIn({
    required String email,
    required String password,
  });

  Future<String?> signUp({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class StubAuthService implements AuthService {
  const StubAuthService();

  @override
  Future<String?> signIn({
    required String email,
    required String password,
  }) async => null;

  @override
  Future<String?> signUp({
    required String email,
    required String password,
  }) async => null;

  @override
  Future<void> signOut() async {}
}
