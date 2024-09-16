import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:yyyyyyyyy/utils/printvalue.dart';
import 'package:yyyyyyyyy/utils/toastMess.dart';

import '../storage/storage_helper.dart';

class http_Hepler {
  Map<String, String> header(bool isRequireAuthorization) {
    if (isRequireAuthorization) {
      return {
        "Authorization": "Bearer ${StorageHelper().getToken()}",
        // "Authorization": "Bearer {your access token}",
        'Content-Type': 'application/json'
      };
    } else {
      return {'Content-Type': 'application/json'};
    }
  }

//getApi
  Future<dynamic> getApi({
    required String url,
    bool isRequireAuthorization = false,
  }) async {
    try {
      final apirespnse = await http.get(Uri.parse(url),
          headers: header(isRequireAuthorization));
      printvalue(url, tag: "Api Get url: ");
      printvalue(header(isRequireAuthorization), tag: "Api Header: ");
      printvalue(apirespnse.body, tag: "Api Response");
      return _returenResponse(apirespnse);
    } on SocketException {
      return null;
    }
  }

  Future<dynamic> getApiJWT({
    required String url,
    required String jwtToken,
  }) async {
    try {
      // Making the GET request with JWT in the header
      final apiResponse = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $jwtToken',
        },
      );

      // Logging for debugging purposes
      print("API Get URL: $url");
      print("API Header (JWT): $jwtToken");
      print("API Response: ${apiResponse.body}");

      // Handle and return the response
      return _returenResponse(apiResponse);
    } on SocketException {
      print("No Internet connection");
      return null; // Handle this case as needed in your app
    } catch (e) {
      print("Error occurred: $e");
      return null; // Handle any other exceptions
    }
  }

  Future<dynamic> postApi(
      {required String url,
      Object? requestBody,
      bool isRequireAuthorization = false}) async {
    try {
      http.Response apiresponse;
      if (requestBody == null) {
        apiresponse = await http.post(Uri.parse(url),
            headers: header(isRequireAuthorization));
      } else {
        apiresponse = await http.post(Uri.parse(url),
            body: jsonEncode(requestBody),
            headers: header(isRequireAuthorization));
      }
      printvalue(url, tag: "Api Get url: ");
      printvalue(header(isRequireAuthorization), tag: "Api Header: ");
      printvalue(apiresponse.body, tag: "Api Response");
      printvalue(requestBody, tag: "Api resonse body");
      return _returenResponse(apiresponse);
    } on SocketException {
      return null;
    }
  }

  Future<dynamic> putApi(
      {required String url,
      Object? requestBody,
      bool isRequireAuthorization = false}) async {
    try {
      http.Response apiresponse;
      if (requestBody == null) {
        apiresponse = await http.put(Uri.parse(url),
            headers: header(isRequireAuthorization));
      } else {
        apiresponse = await http.put(Uri.parse(url),
            body: jsonEncode(requestBody),
            headers: header(isRequireAuthorization));
      }
      printvalue(url, tag: "Api Get url: ");
      printvalue(header(isRequireAuthorization), tag: "Api Header: ");
      printvalue(apiresponse.body, tag: "Api Response");
      printvalue(requestBody, tag: "Api resonse body");
      return _returenResponse(apiresponse);
    } on SocketException {
      return null;
    }
  }

  Future<dynamic> patchApi(
      {required String url,
      Object? requestBody,
      bool isRequireAuthorization = false}) async {
    try {
      http.Response apiresponse;
      if (requestBody == null) {
        apiresponse = await http.patch(Uri.parse(url),
            headers: header(isRequireAuthorization));
      } else {
        apiresponse = await http.patch(Uri.parse(url),
            body: jsonEncode(requestBody),
            headers: header(isRequireAuthorization));
      }
      printvalue(url, tag: "Api Get url: ");
      printvalue(header(isRequireAuthorization), tag: "Api Header: ");
      printvalue(apiresponse.body, tag: "Api Response");
      printvalue(requestBody, tag: "Api resonse body");
      return _returenResponse(apiresponse);
    } on SocketException {
      return null;
    }
  }

  Future<dynamic> deleteApi(
      {required String url,
      Object? requestBody,
      bool isRequireAuthorization = false}) async {
    try {
      http.Response apiresponse;
      if (requestBody == null) {
        apiresponse = await http.delete(Uri.parse(url),
            headers: header(isRequireAuthorization));
      } else {
        apiresponse = await http.delete(Uri.parse(url),
            body: jsonEncode(requestBody),
            headers: header(isRequireAuthorization));
      }
      printvalue(url, tag: "Api Get url: ");
      printvalue(header(isRequireAuthorization), tag: "Api Header: ");
      printvalue(apiresponse.body, tag: "Api Response");
      printvalue(requestBody, tag: "Api resonse body");
      return _returenResponse(apiresponse);
    } on SocketException {
      return null;
    }
  }

  //multipart api handle
  Future<dynamic> uploadImage(
      {required File imageFile, required String url}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({"Content-Type": "multipart/form-data"});

      request.files.add(
        await http.MultipartFile.fromPath('file', imageFile.path,
            filename: imageFile.path.split("/").last),
      );

      var streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);

      printvalue(url, tag: "Api Get url: ");
      printvalue({"Content-Type": "multipart/form-data"}, tag: "Api Header: ");
      printvalue(response.body, tag: "Api Response");
      return _returenResponse(response);
    } on SocketException {
      print('Error: No internet connection');
    } catch (e) {
      print('Error: $e');
    }
  }
}

dynamic _returenResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responsejson = jsonDecode(response.body);
      return responsejson;
    case 201:
      var responseJson = jsonDecode(response.body);
      return responseJson;

    case 400:
      var decodeError = jsonDecode(response.body);
      if (decodeError.containsKey('error')) {
        toastMessage(decodeError['error'].toString());
      }
      throw Exception('API error status Code 400');
    case 401:
      toastMessage("UnAuthorised url 401");
      throw Exception("UnAuthorised url 401");

    case 500:
      toastMessage(
          "Error occure while communication with server with statusCode 500");
      throw Exception(
          "Error occure while communication with server with statusCode 500");

    default:
      toastMessage(
          "Error occure while communication with server with statusCode ${response.statusCode.toString()}");
      throw Exception(
          "Error occure while communication with server with statusCode ${response.statusCode.toString()}");
  }
  // return null;
}
