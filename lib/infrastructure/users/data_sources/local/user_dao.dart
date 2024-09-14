import 'package:payuung_clone/domain/users/entities/user_profile.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  final Database db;

  UserDao(this.db);

  Future<void> insertUserProfile(UserProfile profile) async {
    await db.insert('user_profile', profile.toJson());
  }

  Future<UserProfile?> getUserProfile() async {
    final result = await db.query('user_profile');
    if (result.isEmpty) return null;
    return UserProfile.fromJson(result.first);
  }

  Future<void> updateUserProfile(UserProfile profile) async {
    await db.update('user_profile', profile.toJson());
  }
}
