//model strucutre
// [
//   {
//     "id": 1,
//     "name": "Leanne Graham",
//     "username": "Bret",
//     "email": "Sincere@april.biz",
//     "address": {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }
//     },
//     "phone": "1-770-736-8031 x56442",
//     "website": "hildegard.org",
//     "company": {
//       "name": "Romaguera-Crona",
//       "catchPhrase": "Multi-layered client-server neural-net",
//       "bs": "harness real-time e-markets"
//     }
// ]

import 'package:flutter/material.dart';
import 'package:yyyyyyyyy/models/usersListModel.dart';
import 'package:yyyyyyyyy/repository/userListRepo.dart';
import 'package:yyyyyyyyy/response/apiResponse.dart';

import '../utils/toastMess.dart';

class UserlistviewmodelProvider with ChangeNotifier {
  final UserlistRepo _userlistRepo = UserlistRepo();
  bool isLoading = false;
  ApiResponse<List<userListModel>> userListModelVM = ApiResponse.loading();
  void setUserListVM(ApiResponse<List<userListModel>> response) {
    userListModelVM = response;
    notifyListeners();
  }

  Future<void> getUserListVM() async {
    setUserListVM(ApiResponse.loading());
    isLoading = true;
    notifyListeners();
    try {
      await _userlistRepo.getusermodelRepo().then((value) {
        setUserListVM(ApiResponse.completed(value));
        print("print view modal...........................$value");
        isLoading = false;
        notifyListeners();
      });
    } catch (e) {
      setUserListVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }
}
