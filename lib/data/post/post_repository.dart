import 'package:bloc_theming/business_logic/infinite_list/models/post.dart';
import 'package:bloc_theming/data/post/post_data_provider.dart';

class PostRepository {
  final PostDataProvider postDataProvider = PostDataProvider();

  Future<List<Post>> fetchPosts(int startIndex, int limit) {
    return postDataProvider.fetchPosts(startIndex, limit);
  }
}
