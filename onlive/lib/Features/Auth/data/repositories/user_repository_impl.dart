import 'package:dartz/dartz.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:onlive/Features/Auth/data/datasources/auth_remote_data_source.dart';
import 'package:onlive/Features/Auth/domain/entitites/auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../dummy_data.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthRemoteDataSource remoteDataSource;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
      'https://www.googleapis.com/auth/userinfo.profile'
    ],
  );

  final GoogleSignIn googleSignIn;

  UserRepositoryImpl(
    this.remoteDataSource,
    this.googleSignIn,
  );
  @override
  Future<Either<Failure, Auth>> postLogin() async {
    try {
      print('google auth started..');
      print('client id');
      print(_googleSignIn.clientId);

      final response = await _googleSignIn.signIn();
      // response.authentication.
      final google_auth = await response?.authentication;
      print(google_auth?.idToken);

      return remoteDataSource.login('${google_auth?.idToken}');

      // return Right(NoParams());
    } catch (ex) {
      print(ex);
      return Left(LoginFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> logout() async {
    try {
      await _googleSignIn.signOut();
      return Right(NoParams());
    } catch (ex) {
      // TODO: Implement Signout Failure
      print(ex);
      return Left(LoginFailure());
    }
  }
}
