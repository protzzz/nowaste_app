import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  Future<void> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString('x-auth-token', token);
  }

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('x-auth-token');
  }

  Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final hasOnboarded = prefs.getBool('hasOnboarded') ?? false;
    return !hasOnboarded;
  }

  Future<void> setHasOnboarded() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasOnboarded', true);
  }
}
