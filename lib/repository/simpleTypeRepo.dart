//model structure
// {
//     "data": {
//         "id": 2,
//         "email": "janet.weaver@reqres.in",
//         "first_name": "Janet",
//         "last_name": "Weaver",
//         "avatar": "https://reqres.in/img/faces/2-image.jpg"
//     },
//     "support": {
//         "url": "https://reqres.in/#support-heading",
//         "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
//     }
// }

import 'package:yyyyyyyyy/models/simpleTypeModel.dart';
import 'package:yyyyyyyyy/serviceManage/http_service.dart';

class Simpletyperepo {
  final http_Hepler _http_hepler = http_Hepler();

  Future<SimpleTypeModel> simpleModelRepo() async {
    dynamic response = await _http_hepler.getApi(
        url: "https://reqres.in/api/users/2", isRequireAuthorization: true);

    return SimpleTypeModel.fromJson(response);
  }
}
