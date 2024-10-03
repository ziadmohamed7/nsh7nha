import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class Api {
  Dio dio = Dio();
  // first method is get
  Future<dynamic> get({required String path}) async {
    Response response = await dio.get(path);
    if (response.statusCode == 200 && response.data['success']) {
      return response;
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} with body ${response.data}");
    }
  }

  Map<String, String> headers = {
    "Accept": "application/json",
    "fcm_token": "123",
  };

  Future<Response> post(
      {required String path, @required dynamic data, String? token}) async {
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    return await dio.post(
      path,
      data: data,
      options: Options(
        headers: headers,
      ),
    );
  }
}
