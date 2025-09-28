import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _userDataKey = 'user_id';

  final FlutterSecureStorage _storage;

  const SecureStorage(this._storage);

  Future<void> storeTokens({required String accessToken, required String refreshToken}) async {
    await Future.wait([
      _storage.write(key: _accessTokenKey, value: accessToken),
      _storage.write(key: _refreshTokenKey, value: refreshToken),
    ]);
  }

  Future<String?> getAccessTokens() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshTokens() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> storeUserData(String userData) async {
    await _storage.write(key: _userDataKey, value: userData);
  }

  Future<String?> getUserData() async {
    return await _storage.read(key: _userDataKey);
  }

  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}