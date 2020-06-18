import 'package:bloc_theming/data/post/post_data_provider.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  static http.Client httpClient;
  final PostDataProvider postDataProvider =
      PostDataProvider(httpClient: httpClient);
}
