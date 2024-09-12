import 'dart:io';

import 'package:yyyyyyyyy/models/uploadImageModel.dart';
import 'package:yyyyyyyyy/serviceManage/http_service.dart';

class UploadimageApiRepo {
  http_Hepler _http_hepler = http_Hepler();

  Future<uploadImageModel> uploadRepo(File imageFile) async {
    dynamic response = await _http_hepler.uploadImage(
      url: "https://api.escuelajs.co/api/v1/files/upload",
      imageFile: imageFile,
    );
    return uploadImageModel.fromJson(response);
  }
}
