import 'package:yyyyyyyyy/serviceManage/http_service.dart';

class CountriesRepository {
  final http_Hepler _helper = http_Hepler();

  Future<List<dynamic>> fetchCountries() async {
    try {
      final dynamic response = await _helper.getApi(
        url: "https://disease.sh/v3/covid-19/countries",
        isRequireAuthorization: true,
      );
      return response;
      // List<dynamic> data = response as List<dynamic>;
      // print("repo data print........................ $data");
      // return data.map((item) => CountriesModel.fromJson(item)).toList();
    } catch (e) {
      print("Error fetching data: $e");
      throw Exception('Failed to load countries');
    }
  }
}
