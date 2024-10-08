import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class Api {
  Dio dio = Dio();

  Map<String, String> headers = {};

  // first method is get
  Future<Response> get({required String path, String? token}) async {
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    Response response = await dio.get(
      path,
      options: Options(
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          "there is a problem with status code ${response.statusCode} with body ${response.data}");
    }
  }

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
