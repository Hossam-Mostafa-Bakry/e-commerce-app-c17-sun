abstract class AuthInterfaceHandler {
  static const tokenKey = "Authorization";

  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> clearToken();

  Future<bool> isAuthenticated();
}
