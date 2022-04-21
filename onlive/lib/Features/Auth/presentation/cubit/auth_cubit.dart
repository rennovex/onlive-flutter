import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:onlive/Features/Auth/domain/usecase/silent_login.dart';

import '../../domain/entitites/auth.dart';
import '../../domain/usecase/logout.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecase/post_login.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final PostLogin postLogin;
  final Logout logout;
  final SilentLogin silentLogin;
  AuthCubit({
    required this.postLogin,
    required this.silentLogin,
    required this.logout,
  }) : super(AuthInitial());

  Future<void> login() async {
    emit(Loading());
    final response = await postLogin(NoParams());
    response.fold((failure) async {
      print(failure);
      await logout(NoParams());
      emit(UnAuthenticated());
    }, (auth) => emit(Authenticated(auth)));
    // emit(Authenticated());
  }

  Future<void> trySilentLogin() async {
    emit(Loading());
    final silentLoginResult = await silentLogin(NoParams());
    silentLoginResult.fold((failure) {
      print(failure);
      emit(UnAuthenticated());
    }, (auth) => emit(Authenticated(auth)));
  }

  Future<void> signout() async {
    final result = await logout(NoParams());
    emit(UnAuthenticated());
  }
}
