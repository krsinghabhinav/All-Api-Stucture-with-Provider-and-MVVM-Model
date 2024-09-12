//model structure
// {
//     "data": {
//         "id": 2,
//         "email": "janet.weaver@reqres.in",
//         "first_name": "Janet",
//         "last_name": "Weaver",
//         "avatar": "https://reqres.in/img/faces/2-image.jpg"
//     },
//     "support": {
//         "url": "https://reqres.in/#support-heading",
//         "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
//     }
// }

import 'package:flutter/foundation.dart';
import 'package:yyyyyyyyy/repository/simpleTypeRepo.dart';

import '../models/simpleTypeModel.dart';
import '../response/apiResponse.dart';
import '../utils/toastMess.dart';

class SimpleTypeApiProvider with ChangeNotifier {
  final Simpletyperepo _simpletyperepo = Simpletyperepo();

  bool isLoading = false;
  ApiResponse<SimpleTypeModel> simpleTypeMVM = ApiResponse.loading();

  void setSingleTypeListVM(ApiResponse<SimpleTypeModel> response) {
    simpleTypeMVM = response;
    notifyListeners();
  }

  Future<void> fetchSimpleTypeModel() async {
    setSingleTypeListVM(ApiResponse.loading());
    isLoading = true;
    notifyListeners();

    try {
      final data = await _simpletyperepo.simpleModelRepo();
      setSingleTypeListVM(ApiResponse.completed(data));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      setSingleTypeListVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }
}
