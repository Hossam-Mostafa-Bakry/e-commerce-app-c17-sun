import 'package:ecommerce_app/core/handler/auth_handler/auth_interface_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHandlerSharedPref implements AuthInterfaceHandler {
  String? _cachedToken;

  @override
  Future<void> saveToken(String token) async {
    _cachedToken = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AuthInterfaceHandler.tokenKey, token);
  }

  @override
  Future<String?> getToken() async {
    if (_cachedToken != null) {
      return _cachedToken;
    }
    final prefs = await SharedPreferences.getInstance();
    _cachedToken = prefs.getString(AuthInterfaceHandler.tokenKey);

    return _cachedToken;
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null;
  }

  @override
  Future<void> clearToken() async {
    _cachedToken = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AuthInterfaceHandler.tokenKey);
  }
}
