import 'package:yyyyyyyyy/models/singupModel.dart';
import 'package:yyyyyyyyy/serviceManage/http_service.dart';

class SingupRepos {
  http_Hepler _http_hepler = http_Hepler();
  Future<SignupModel> singUpRepo(Object requestBody) async {
    dynamic response = await _http_hepler.postApi(
        // url: "https://reqres.in/api/login",
        url: "https://reqres.in/api/register",
        requestBody: requestBody,
        isRequireAuthorization: true);
    return SignupModel.fromJson(response);
  }
}
