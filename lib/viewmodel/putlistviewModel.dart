import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yyyyyyyyy/models/putmodelpi.dart';
import 'package:yyyyyyyyy/models/singupModel.dart';
import 'package:yyyyyyyyy/repository/putModelRepo.dart';
import 'package:yyyyyyyyy/view/ListTypeModelView.dart';
import 'package:yyyyyyyyy/view/singupScreen.dart';

import '../repository/singUPRepo.dart';
import '../response/apiResponse.dart';
import '../storage/storage_helper.dart';
import '../utils/toastMess.dart';

class PutProvider with ChangeNotifier {
  PutRepos _putRepos = PutRepos();
  bool isLoading = false;
  ApiResponse<PutModelApi> putlistVM = ApiResponse.loading();

  void setPutApiListVM(ApiResponse<PutModelApi> response) {
    putlistVM = response;
    notifyListeners();
  }

  Future<void> getPutVM(String name, String job) async {
    setPutApiListVM(ApiResponse.loading());
    isLoading = true;
    notifyListeners();

    Map<String, dynamic> requestBody = {
      "name": name,
      "job": job,
    };

    try {
      final putUser = await _putRepos.putApiRepo(requestBody);
      setPutApiListVM(ApiResponse.completed(putUser));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      setPutApiListVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }
}
