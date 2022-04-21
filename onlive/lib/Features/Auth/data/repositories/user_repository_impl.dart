import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../datasources/auth_remote_data_source.dart';
import '../../domain/entitites/auth.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../dummy_data.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthRemoteDataSource remoteDataSource;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
    'openid'
  ]);

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
      print(google_auth?.accessToken);

      final credential = GoogleAuthProvider.credential(
        accessToken: google_auth?.accessToken,
        idToken: google_auth?.idToken,
      );

      final authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final currentUser = FirebaseAuth.instance.currentUser;

      String idToken = await currentUser!.getIdToken(true);

      // print('idToken using print: ');
      // print(idToken);

      // print('idToken using log: ');
      // log(idToken);

      // print('idToken using custom function: ');
      // while (idToken.length > 0) {
      //   int initLength = (idToken.length >= 500 ? 500 : idToken.length);
      //   print(idToken.substring(0, initLength));
      //   int endLength = idToken.length;
      //   idToken = idToken.substring(initLength, endLength);
      // }

      return remoteDataSource.login(idToken);

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
