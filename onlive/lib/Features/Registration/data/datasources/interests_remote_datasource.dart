import '../models/interest_model.dart';

abstract class InterestsRemoteDataSource {
  /// Calls the /api/<>.com/users endpoint.
  ///
  /// Throws a [ServerException] for all error codes.

  Future<List<InterestModel>> getInterests();
}

class InterestsRemoteDataSourceImpl implements InterestsRemoteDataSource {
  @override
  Future<List<InterestModel>> getInterests() {
    // TODO: implement getInterests
    throw UnimplementedError();
  }
}
