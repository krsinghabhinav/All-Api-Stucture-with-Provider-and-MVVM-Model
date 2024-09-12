import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yyyyyyyyy/models/deleteApiModel.dart';
import 'package:yyyyyyyyy/models/patchapiModel.dart';

import '../repository/deleteApiRepo.dart';
import '../repository/patchApiRepo.dart';
import '../response/apiResponse.dart';
import '../utils/toastMess.dart';

class DeleteProvider with ChangeNotifier {
  DeleteApiRepo _deleteRepos = DeleteApiRepo();
  bool isLoading = false;
  ApiResponse<deleteApiModel> deleteListVM = ApiResponse.loading();

  void setDeleteApiListVM(ApiResponse<deleteApiModel> response) {
    deleteListVM = response;
    notifyListeners();
  }

  Future<void> getDeleteVM(
    String id,
  ) async {
    setDeleteApiListVM(ApiResponse.loading());
    isLoading = true;
    notifyListeners();

    // Map<String, dynamic> requestBody = {
    //   "name": name,
    //   "job": job,
    // };

    try {
      final deleteUser = await _deleteRepos.deleteRepo(id);
      setDeleteApiListVM(ApiResponse.completed(deleteUser));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      setDeleteApiListVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }
}
