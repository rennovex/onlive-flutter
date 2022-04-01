import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entitites/auth.dart';
import '../../domain/usecase/logout.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecase/post_login.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final PostLogin postLogin;
  final Logout logout;
  AuthCubit({
    required this.postLogin,
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
}
