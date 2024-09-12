import 'dart:io';
import 'package:flutter/material.dart';
import 'package:yyyyyyyyy/models/uploadImageModel.dart';
import 'package:yyyyyyyyy/repository/uploadImageRepo.dart';
import '../response/apiResponse.dart';
import '../utils/toastMess.dart';

class UploadImageProvider with ChangeNotifier {
  UploadimageApiRepo _uploadimageApiRepo = UploadimageApiRepo();
  bool isLoading = false;
  ApiResponse<uploadImageModel> uploadListVM = ApiResponse.loading();

  void setUploadImageApiListVM(ApiResponse<uploadImageModel> response) {
    uploadListVM = response;
    notifyListeners();
  }

  Future<void> uploadImage(File imageFile) async {
    setUploadImageApiListVM(ApiResponse.loading());
    isLoading = true;
    notifyListeners();

    try {
      final UploadUser = await _uploadimageApiRepo.uploadRepo(imageFile);
      setUploadImageApiListVM(ApiResponse.completed(UploadUser));
      isLoading = false;
      notifyListeners();
    } catch (e) {
      setUploadImageApiListVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}");
      isLoading = false;
      notifyListeners();
    }
  }
}
