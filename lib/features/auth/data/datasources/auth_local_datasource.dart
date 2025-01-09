// import 'package:homeegram/core/storage/hive_storage.dart';

// class AuthLocalDataSource {
//   final HiveStorage _storage;

//   AuthLocalDataSource(this._storage);

//   Future<void> cacheUser(UserModel user) async {
//     await _storage.put('cached_user', user.toJson());
//   }

//   Future<UserModel?> getLastUser() async {
//     final userData = await _storage.get('cached_user');
//     if (userData != null) {
//       return UserModel.fromJson(userData);
//     }
//     return null;
//   }
// }
