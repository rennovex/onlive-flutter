import '../models/post_model.dart';
import '../../../../core/errors/exceptions.dart';

abstract class PostsLocalDataSource {
  /// Gets the cached [PostModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.

}

const String CACHED_LIST_POSTS = 'CACHED_LIST_POSTS';
