import 'package:dartz/dartz.dart';
import 'package:onlive/core/errors/exceptions.dart';

import 'package:onlive/core/secure_storage/secure_storage.dart';
import 'package:onlive/core/usecases/usecase.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entitites/auth.dart';

abstract class AuthLocalDataSource {
  /// Calls the http://numbersapi.com/{number} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Auth> loginFromCache();
  Future<NoParams> saveToCache(Auth auth);
  Future<NoParams> deleteAll();

  /// Calls the http://numbersapi.com/random endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  // Future<NumberTriviaModel> getRandomNumberTrivia();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorage secureStorage;
  AuthLocalDataSourceImpl({
    required this.secureStorage,
  });

  @override
  Future<Auth> loginFromCache() async {
    try {
      final result = await secureStorage.readAllValues();
      print(result['auth']);
      print('secureStorage result ' + authFromJson(result['auth']!).id);
      return authFromJson(result['auth']!);
    } catch (ex) {
      print('error in secure storage' + ex.toString());
      throw CacheFailure();
    }
  }

  @override
  Future<NoParams> saveToCache(Auth auth) async {
    try {
      final result = await secureStorage.save(authToJson(auth));
      return NoParams();
    } catch (ex) {
      throw CacheFailure();
    }
  }

  @override
  Future<NoParams> deleteAll() async {
    try {
      await secureStorage.deleteAll();
      return NoParams();
    } catch (ex) {
      print(ex);
      return NoParams();
    }
  }
}
