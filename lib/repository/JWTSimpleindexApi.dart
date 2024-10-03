// import 'package:hostelpedia/baseUrl/baseurlApi.dart';
// import 'package:hostelpedia/constent/Constant.dart';
// import 'package:hostelpedia/model/hostelViaIdModel.dart';
// import 'package:hostelpedia/services/http_services.dart';
// import 'package:hostelpedia/jwt.dart';
// import 'package:yyyyyyyyy/serviceManage/http_service.dart';

// class HostelviaidRepo {
//   // Renamed variable to follow Dart's naming conventions
//   final http_Hepler _httpHelper = http_Hepler();

//   Future<hostelViaIdModel?> getHostelViaRepo() async {
//     try {
//       // Generate JWT token
//       final authSigner = AuthSigner();
//       final jwt = authSigner.createJwt();

//       // Ensure proper concatenation of the base URL and endpoint
//       String url = '${Baseurlapi.baseUrl}${Constant.HOSTEL}';
//       print("PAPAYA CODERS -------------------- $url");

//       // Fetch the API data
//       dynamic response = await _httpHelper.getApi(url: url, jwtToken: jwt);

//       // Check if response is null or empty before parsing

//       // if (response == null) {
//       //   print("Error: API response is null");
//       //   return null;
//       // }

//       // Parse the response into hostelViaIdModel
//       return hostelViaIdModel.fromJson(response);
//     } catch (e) {
//       // Handle exceptions (like network errors, parsing errors)
//       print("Error occurred: $e");
//       return null;
//     }
//   }
// }
