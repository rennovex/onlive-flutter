import 'package:dartz/dartz.dart';
import '../../domain/repositories/user_repository.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/errors/failures.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserRepositoryImpl implements UserRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  final GoogleSignIn googleSignIn;

  UserRepositoryImpl(this.googleSignIn);
  @override
  Future<Either<Failure, NoParams>> postLogin() async {
    try {
      print('google auth started..');
      final response = await _googleSignIn.signIn();
      print(response);
      return Right(NoParams());
    } catch (ex) {
      print(ex);
      return Left(LoginFailure());
    }
  }
}
