//model Structure
// [
//     {
//         "userId": 1,
//         "id": 1,
//         "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
//         "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
//     },
// ]

import 'package:flutter/foundation.dart';
import 'package:yyyyyyyyy/models/ListApipostmodel.dart';
import 'package:yyyyyyyyy/repository/ListApipostRepo.dart';
import 'package:yyyyyyyyy/response/apiResponse.dart';
import 'package:yyyyyyyyy/utils/toastMess.dart';

class PostViewModelProvider with ChangeNotifier {
  final PostRepository _postRepository = PostRepository();
  bool isLoading = false;
  ApiResponse<List<PostModel>> postModelListVM = ApiResponse.loading();

  void setPostModelListVM(ApiResponse<List<PostModel>> response) {
    postModelListVM = response;
    notifyListeners();
  }

  Future<void> fetchPosts() async {
    setPostModelListVM(ApiResponse.loading());
    isLoading = true;
    notifyListeners();

    try {
      // await _postRepository.getPosts().then((postList) {
      //   setPostModelListVM(ApiResponse.completed(postList));
      // });
// orrrrrrr
      List<PostModel> postlsitvm = await _postRepository.getPosts();
      setPostModelListVM(ApiResponse.completed(postlsitvm));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      setPostModelListVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }
}
