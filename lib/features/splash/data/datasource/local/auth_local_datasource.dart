import 'dart:developer';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../../../../signup/data/model/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);
  Future<UserModel?> getLastUser();
  Future<void> clearCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final Box _authBox;
  static const String _userKey = 'CACHED_USER';

  AuthLocalDataSourceImpl(this._authBox);

  @override
  Future<void> cacheUser(UserModel user) async {
    // save current user id
    _authBox.put("userId", user.userId);
    // Store user as a Map/JSON string
    await _authBox.put(_userKey, user.toMap());
  }

  @override
  Future<UserModel?> getLastUser() async {
    log("Data fetch from local storage");
    final userData = _authBox.get(_userKey);
    if (userData != null) {
      return UserModel.fromMap(Map<String, dynamic>.from(userData));
    }
    return null;
  }

  @override
  Future<void> clearCache() async {
    await _authBox.delete(_userKey);
    await _authBox.delete("userId");
  }
}
