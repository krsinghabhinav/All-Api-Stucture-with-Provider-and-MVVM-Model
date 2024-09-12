import 'package:yyyyyyyyy/models/patchapiModel.dart';
import 'package:yyyyyyyyy/serviceManage/http_service.dart';

class PatchApiRepo {
  http_Hepler _http_hepler = http_Hepler();

  Future<PatchApiModel> patchRepo(Object requestBody) async {
    dynamic response = await _http_hepler.patchApi(
        url: "https://reqres.in/api/users/2",
        requestBody: requestBody,
        isRequireAuthorization: true);
    return PatchApiModel.fromJson(response);
  }
}
