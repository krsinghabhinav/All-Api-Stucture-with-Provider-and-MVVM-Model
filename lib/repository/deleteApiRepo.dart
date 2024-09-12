import 'package:yyyyyyyyy/models/deleteApiModel.dart';
import 'package:yyyyyyyyy/models/patchapiModel.dart';
import 'package:yyyyyyyyy/serviceManage/http_service.dart';

class DeleteApiRepo {
  http_Hepler _http_hepler = http_Hepler();

  Future<deleteApiModel> deleteRepo(String id) async {
    dynamic response = await _http_hepler.deleteApi(
        url: "https://fakestoreapi.com/users/$id",
        isRequireAuthorization: true);
    return deleteApiModel.fromJson(response);
  }
}
