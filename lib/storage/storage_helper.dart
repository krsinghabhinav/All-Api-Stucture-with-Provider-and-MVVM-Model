import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  StorageHelper._(); // Singleton
  static final StorageHelper instance = StorageHelper._();
  factory StorageHelper() {
    return instance;
  }

  late SharedPreferences sp;

  Future<void> init() async {
    sp = await SharedPreferences.getInstance();
  }

  void cleandata() {
    sp.clear();
  }

  String getToken() {
    return sp.getString('token') ?? "";
  }

  void setToken(String token) {
    sp.setString("token", token); // Use a fixed key 'token'
  }
}
