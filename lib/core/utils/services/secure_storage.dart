import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: const AndroidOptions(
      encryptedSharedPreferences: true,
      preferencesKeyPrefix: 'edutime_secure_',
      keyCipherAlgorithm: KeyCipherAlgorithm.RSA_ECB_PKCS1Padding,
      storageCipherAlgorithm: StorageCipherAlgorithm.AES_CBC_PKCS7Padding,
    ),

    iOptions: IOSOptions(
      groupId: 'group.com.edutime.app',
      accountName: 'edutime_keychain',
      accessibility: KeychainAccessibility.first_unlock_this_device
    ),
  );

  // Storage Keys
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _accessTokenExpiryKey = 'access_token_expiry';
  static const String _refreshTokenExpiryKey = 'refresh_token_expiry';
  static const String _userCredentialsKey = 'user_credentials';
  static const String _deviceIdKey = 'device_id';
  static const String _lastLoginEmailKey = 'last_login_email';
  static const String _rememberMeKey = 'remember_me';

  Future<void> storeAccessToken(String accessToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  Future<void> storeRefreshToken(String refreshToken) async {
    return await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  Future<void> storeTokenExpiry({
    required DateTime accessTokenExpiry,
    required DateTime refreshTokenExpiry
  }) async {
    await Future.wait([
      _storage.write(key: _accessTokenExpiryKey, value: accessTokenExpiry.toIso8601String()),
      _storage.write(key: _refreshTokenExpiryKey, value: refreshTokenExpiry.toIso8601String()),
    ]);
  }

  Future<DateTime?> getAccessTokenExpiry() async {
    final expiry = await _storage.read(key: _accessTokenExpiryKey);
    if (expiry != null) {
      return DateTime.parse(expiry);
    }
    return null;
  }

  Future<DateTime?> getRefreshTokenExpiry() async {
    final expiry = await _storage.read(key: _refreshTokenExpiryKey);
    if (expiry != null) {
      return DateTime.parse(expiry);
    }
    return null;
  }

  Future<void> storeTokenData({
    required String accessToken,
    required String refreshToken,
    required DateTime accessTokenExpiry,
    required DateTime refreshTokenExpiry
  }) async {
    await Future.wait([
      storeAccessToken(accessToken),
      storeRefreshToken(refreshToken),
      storeTokenExpiry(
        accessTokenExpiry: accessTokenExpiry,
        refreshTokenExpiry: refreshTokenExpiry
      ),
    ]);
  }

  Future<bool> isAccessTokenValid() async {
    final expiry = await getAccessTokenExpiry();
    if (expiry != null) {
      return expiry.isAfter(DateTime.now());
    }
    return false;
  }

  Future<bool> isRefreshTokenValid() async {
    final expiry = await getRefreshTokenExpiry();
    if (expiry != null) {
      return expiry.isAfter(DateTime.now());
    }
    return false;
  }

  Future<void> storeUserCredentials({
    required String email,
    required String password
  }) async {
    final credentials = {
      'email': email,
      'password': password
    };
    await _storage.write(key: _userCredentialsKey, value: credentials.toString());
  }

  Future<Map<String, String>?> getUserCredentials() async {
    final credentials = await _storage.read(key: _userCredentialsKey);
    if (credentials != null) {
      return Map<String, String>.from(credentials.toString() as Map);
    }
    return null;
  }

  Future<void> storeDeviceId(String deviceId) async {
    await _storage.write(key: _deviceIdKey, value: deviceId);
  }

  Future<String?> getDeviceId() async {
    return await _storage.read(key: _deviceIdKey);
  }

  Future<String?> getLastLoginEmail() async {
    return await _storage.read(key: _lastLoginEmailKey);
  }

  Future<void> setRememberMe(bool remember) async {
    await _storage.write(key: _rememberMeKey, value: remember.toString());
  }

  Future<bool> getRememberMe() async {
    final remember = await _storage.read(key: _rememberMeKey);
    return remember == 'true';
  }

  Future<void> clearAuthData() async {
    await Future.wait([
      _storage.delete(key: _accessTokenKey),
      _storage.delete(key: _refreshTokenKey),
      _storage.delete(key: _accessTokenExpiryKey),
      _storage.delete(key: _refreshTokenExpiryKey),
    ]);
  }

  Future<void> clearUserCredentials() async {
    await _storage.delete(key: _userCredentialsKey);
  }

  Future<void> clearAllData() async {
    await _storage.deleteAll();
  }

  Future<bool> hasAuthData() async {
    final accessToken = await getAccessToken();
    final refreshToken = await getRefreshToken();
    return accessToken != null || refreshToken != null;
  }

  Future<Map<String, String>> getAllStoredData() async {
    return await _storage.readAll();
  }

  /*/// Migrate data from old storage format (if needed)
  Future<void> migrateStorageFormat() async {
    try {
      // Implementation for migrating from old storage format
      // This would be used during app updates
      final allData = await _storage.readAll();

      // Check if migration is needed
      if (allData.containsKey('old_token_key')) {
        // Perform migration logic
        final oldToken = allData['old_token_key'];
        if (oldToken != null) {
          await storeAccessToken(oldToken);
          await _storage.delete(key: 'old_token_key');
        }
      }
    } catch (e) {
      throw SecureStorageException('Failed to migrate storage format: $e');
    }
  }*/
}