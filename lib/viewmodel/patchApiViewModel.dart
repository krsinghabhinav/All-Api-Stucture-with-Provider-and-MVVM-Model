import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yyyyyyyyy/models/patchapiModel.dart';

import '../repository/patchApiRepo.dart';
import '../response/apiResponse.dart';
import '../utils/toastMess.dart';

class PatchProvider with ChangeNotifier {
  PatchApiRepo _patchRepos = PatchApiRepo();
  bool isLoading = false;
  ApiResponse<PatchApiModel> patchlistVM = ApiResponse.loading();

  void setPatchApiListVM(ApiResponse<PatchApiModel> response) {
    patchlistVM = response;
    notifyListeners();
  }

  Future<void> getPatchVM(String name, String job) async {
    setPatchApiListVM(ApiResponse.loading());
    isLoading = true;
    notifyListeners();

    Map<String, dynamic> requestBody = {
      "name": name,
      "job": job,
    };

    try {
      final patchUser = await _patchRepos.patchRepo(requestBody);
      setPatchApiListVM(ApiResponse.completed(patchUser));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      setPatchApiListVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }
}
