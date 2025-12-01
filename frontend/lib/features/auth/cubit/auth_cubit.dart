import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowaste_app/core/services/shared_preferences_service.dart';
import 'package:nowaste_app/features/auth/repository/auth_local_repository.dart';
import 'package:nowaste_app/features/auth/repository/auth_remote_repository.dart';
import 'package:nowaste_app/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authRemoteRepository = AuthRemoteRepository();
  final authLocalRepository = AuthLocalRepository();
  final sharedPreferencesService = SharedPreferencesService();

  void getUserData() async {
    try {
      emit(AuthLoading());

      final userModel = await authRemoteRepository.getUserData();
      print('CUBIT getUserData userModel: $userModel');

      if (userModel != null) {
        await authLocalRepository.insertUser(userModel);
        emit(AuthLoggedIn(userModel));
      } else {
        emit(AuthInitial());
      }
    } catch (error) {
      // print('CUBIT getUserData error: $error');
      emit(AuthError(error.toString()));
    }
  }

  void signUp({
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

      await authRemoteRepository.signUp(
        name: name,
        surname: surname,
        email: email,
        password: password,
      );

      emit(AuthSignUp());
      // print(userModel);
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }

  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

      final user = await authRemoteRepository.login(
        email: email,
        password: password,
      );

      if (user.token.isNotEmpty) {
        await sharedPreferencesService.setToken(user.token);
      }

      await authLocalRepository.insertUser(user);

      emit(AuthLoggedIn(user));
    } catch (error) {
      emit(AuthError(error.toString()));
    }
  }
}
