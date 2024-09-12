import 'package:yyyyyyyyy/models/putmodelpi.dart';
import 'package:yyyyyyyyy/serviceManage/http_service.dart';

class PutRepos {
  http_Hepler _http_hepler = http_Hepler();
  Future<PutModelApi> putApiRepo(Object requestBody) async {
    final dynamic response = await _http_hepler.putApi(
        url: "https://reqres.in/api/users/2",
        requestBody: requestBody,
        isRequireAuthorization: true);
    return PutModelApi.fromJson(response);
  }
}
