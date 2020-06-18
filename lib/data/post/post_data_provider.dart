import 'dart:convert';

import 'package:bloc_theming/business_logic/infinite_list/models/post.dart';
import 'package:http/http.dart' as http;

class PostDataProvider {
  final http.Client httpClient = http.Client();

  Future<List<Post>> fetchPosts(int startIndex, int limit) async {
    final _url =
        'https://jsonplaceholder.typicode.com/posts'; //?_start=$startIndex&_limit=$limit');
    print("trying to reach $_url");
    final response = await httpClient.get(_url);
    print('response = {${response.statusCode}}');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}
