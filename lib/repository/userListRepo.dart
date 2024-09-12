import 'package:yyyyyyyyy/models/usersListModel.dart';
import 'package:yyyyyyyyy/serviceManage/http_service.dart';
import 'package:http/http.dart' as http;

class UserlistRepo {
  final http_Hepler _http_hepler = http_Hepler();

  Future<List<userListModel>> getusermodelRepo() async {
    try {
      final dynamic response = await _http_hepler.getApi(
          url: "https://jsonplaceholder.typicode.com/users",
          isRequireAuthorization: true);
      List<dynamic> data = response as List<dynamic>;
      // List<userListModel> userdatalist =
      //  data.map((item) => userListModel.fromJson(item)).toList();
      // return userdatalist;
      return data.map((item) => userListModel.fromJson(item)).toList();
    } catch (e) {
      print("Error faching post $e");
      throw Exception('Failed to load posts');
    }
  }
}
