import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../splash/data/model/user_model.dart';

class ProfileLocalDataSource {
  final Box _authBox;
  static const String _userKey = 'CACHED_USER';

  ProfileLocalDataSource({required Box authBox}) : _authBox = authBox;

  Future<void> cacheUserProfile(UserModel user) async {
    await _authBox.put(_userKey, user.toMap());
  }

  Future<UserModel?> getProfileData() async {
    final userData = _authBox.get(_userKey);
    if (userData != null) {
      return UserModel.fromMap(Map<String, dynamic>.from(userData));
    }
    return null;
  }
}
