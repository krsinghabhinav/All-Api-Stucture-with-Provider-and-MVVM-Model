import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yyyyyyyyy/models/singupModel.dart';
import 'package:yyyyyyyyy/view/ListTypeModelView.dart';
import 'package:yyyyyyyyy/view/singupScreen.dart';

import '../repository/singUPRepo.dart';
import '../response/apiResponse.dart';
import '../storage/storage_helper.dart';
import '../utils/toastMess.dart';

class SignupProvider with ChangeNotifier {
  SingupRepos _singupRepos = SingupRepos();
  bool isLoading = false;
  ApiResponse<SignupModel> singuplistVM = ApiResponse.loading();

  void setSingUpListVM(ApiResponse<SignupModel> response) {
    singuplistVM = response;
    notifyListeners();
  }

  Future<void> getSignUpVM(String email, String password) async {
    setSingUpListVM(ApiResponse.loading());
    isLoading = true;
    notifyListeners();

    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
    };

    try {
      final signUp = await _singupRepos.singUpRepo(requestBody);
      setSingUpListVM(ApiResponse.completed(signUp));

      if (signUp.token != null) {
        // Use singleton instance of StorageHelper
        final storageHelper = StorageHelper.instance;
        storageHelper.setToken(signUp.token!);
        print("Stored token: ${signUp.token}");
        StorageHelper instance = StorageHelper.instance;
        instance.setToken(signUp.token ?? "");
        print("Sotage token ======== ${instance.getToken()}");

        // Navigate to HomePage if token is valid
        Get.offAll(HomePage()); // Use Get.offAll to replace all previous routes
      } else {
        // Navigate to SignUpView if token is not present or invalid
        Get.offAll(SignUpView()); // Replace with actual navigation logic
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      setSingUpListVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }
}
