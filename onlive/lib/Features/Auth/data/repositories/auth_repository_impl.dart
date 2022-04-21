import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../../domain/entitites/auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../dummy_data.dart';
import '../../domain/repositories/auth_repository.dart';

class UserRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'openid'
  ]);

  final GoogleSignIn googleSignIn;

  UserRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.googleSignIn,
  );
  @override
  Future<Either<Failure, Auth>> postLogin() async {
    try {
      print('Reading from api');
      // return Left(CacheFailure());
      final response = await _googleSignIn.signIn();
      // response.authentication.
      final google_auth = await response?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: google_auth?.accessToken,
        idToken: google_auth?.idToken,
      );

      final authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final currentUser = FirebaseAuth.instance.currentUser;

      String idToken = await currentUser!.getIdToken(true);

      final res = await remoteDataSource.login(idToken);
      await localDataSource.saveToCache(res);
      return Right(res);
    } catch (ex) {
      print(ex);
      return Left(LoginFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>> logout() async {
    try {
      await localDataSource.deleteAll();
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
      return Right(NoParams());
    } catch (ex) {
      // TODO: Implement Signout Failure
      print(ex);
      return Left(LoginFailure());
    }
  }

  @override
  Future<Either<Failure, Auth>> silentLogin() async {
    try {
      final cached = await localDataSource.loginFromCache();
      print('cached ' + cached.xAuthToken);
      if (cached == Null) {
        print('Reading from cache');
        return Left(LoginFailure());
      }
      return Right(cached);
    } catch (ex) {
      print('exception while reading from cache' + ex.toString());
      return Left(LoginFailure());
    }
  }
}
