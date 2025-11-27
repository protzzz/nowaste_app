import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nowaste_app/core/constants/api_exception.dart';
import 'package:nowaste_app/core/constants/constants.dart';
import 'package:nowaste_app/core/services/shared_preferences_service.dart';
import 'package:nowaste_app/models/user_model.dart';

class AuthRemoteRepository {
  final sharedPreferencesService = SharedPreferencesService();

  Future<UserModel> signUp({
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    try {
      final res = await http.post(
        Uri.parse('${Constants.backendUri}/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'surname': surname,
          'email': email,
          'password': password,
        }),
      );

      if (res.statusCode != 201) {
        throw jsonDecode(res.body)['error'];
      }

      // if (res.statusCode != 201) {
      //   final decoded = jsonDecode(res.body);
      //   final message = decoded['error'] ?? 'Unknown error';
      //   throw ApiException(
      //     message,
      //     statusCode: res.statusCode,
      //     uri: Uri.parse('${Constants.backendUri}/auth/signup'),
      //   );
      // }

      return UserModel.fromJson(res.body);
    } catch (error) {
      if (error is ApiException) rethrow;
      throw ApiException(error.toString());
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await http.post(
        Uri.parse('${Constants.backendUri}/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['error'];
      }

      // if (res.statusCode != 200) {
      //   final decoded = jsonDecode(res.body);
      //   final message = decoded['error'] ?? 'Unknown error';
      //   throw ApiException(
      //     message,
      //     statusCode: res.statusCode,
      //     uri: Uri.parse('${Constants.backendUri}/auth/login'),
      //   );
      // }

      // print(jsonDecode(res.body));
      return UserModel.fromJson(res.body);
    } catch (error) {
      if (error is ApiException) rethrow;
      throw ApiException(error.toString());
    }
  }

  Future<UserModel?> getUserData() async {
    try {
      final token = await sharedPreferencesService.getToken();

      if (token == null) {
        return null;
      }

      final res = await http.post(
        Uri.parse('${Constants.backendUri}/auth/tokenIsValid'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );

      if (res.statusCode != 200 || jsonDecode(res.body) == false) {
        return null;
      }

      final userResponse = await http.get(
        Uri.parse('${Constants.backendUri}/auth'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': token,
        },
      );

      if (userResponse.statusCode != 200) {
        throw jsonDecode(userResponse.body)['error'];
      }

      print(jsonDecode(userResponse.body)['user']);
      return UserModel.fromJson(userResponse.body);
    } catch (error) {
      if (error is ApiException) rethrow;
      throw ApiException(error.toString());
    }
  }
}
