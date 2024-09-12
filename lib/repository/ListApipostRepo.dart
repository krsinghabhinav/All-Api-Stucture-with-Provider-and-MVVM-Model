//model Structure
// [
//     {
//         "userId": 1,
//         "id": 1,
//         "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//         "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//     },
// ]

import 'package:yyyyyyyyy/models/ListApipostmodel.dart';
import 'package:yyyyyyyyy/serviceManage/http_service.dart';

class PostRepository {
  final http_Hepler _httpHelper = http_Hepler();

  Future<List<PostModel>> getPosts() async {
    try {
      final dynamic response = await _httpHelper.getApi(
        url: "https://jsonplaceholder.typicode.com/posts",
        isRequireAuthorization: true,
      );
      List<dynamic> data = response as List<dynamic>;
      List<PostModel> postlistresponse =
          data.map((item) => PostModel.fromJson(item)).toList();
      return postlistresponse;

      //orrrrrrrr

      // final dynamic response = await _httpHelper.getApi(
      //     url: "https://jsonplaceholder.typicode.com/posts",
      //     isRequireAuthorization: true);
      // List<dynamic> data = response as List<dynamic>;

      // return data.map((item) => PostModel.fromJson(item)).toList();
    } catch (e) {
      print('Error fetching posts: $e');
      throw Exception('Failed to load posts');
    }
  }
}
