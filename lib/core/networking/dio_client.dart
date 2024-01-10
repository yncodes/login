// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';


class DioClient {
  static const int TIME_OUT_DURATION = 600;

  Map<String, dynamic>? globalHeader = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  //GET

  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    try {
      var response = await Dio()
          .get(url,
          options: Options(
            headers: headers ?? globalHeader,
            contentType: 'application/json',
          ),
          queryParameters: params)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      printResponse(url, "${headers ?? globalHeader}", "", "$response");

      return response.data;
    } on DioException {
      printResponse(url, "${headers ?? globalHeader ?? ""}", "", "");

      // var errorText = DioExceptions.fromDioError(e);

      // log("getapi exception ${e.toString()}");
      // log("getapi error text ======  ${errorText.toString()}");
      rethrow;
    }
  }

  //POST

  Future<dynamic> post(
      {required String url,
        Map<String, dynamic>? header,
        Map<String, dynamic>? params,
        dynamic body}) async {
    var payload = json.encode(body);

    try {
      printResponse(url, "${header ?? ""}", jsonEncode(body), "");
      var response = await Dio()
          .post(
        url,
        options: Options(
            headers: header ?? globalHeader,
        ),
        queryParameters: params,
        data: payload,
      )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      printResponse(url, "${header ?? globalHeader}", "$body", "$response");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put(
      {required String url,
        Map<String, dynamic>? header,
        Map<String, dynamic>? params,
        dynamic body}) async {
    var payload = json.encode(body);
    try {
      printResponse(url, "${header ?? ""}", jsonEncode(body), "");
      var response = await Dio()
          .put(
        url,
        options: Options(headers: header ?? globalHeader),
        queryParameters: params,
        data: payload,
      )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      printResponse(url, "${header ?? globalHeader}", "$body", "$response");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //PATCH

  Future<dynamic> patch(
      {required String url,
        // Map<String, dynamic>? header,
        Map<String, dynamic>? params,
        dynamic body}) async {
    var payload = json.encode(body);
    try {
      var response = await Dio()
          .patch(url,
          options: Options(headers: globalHeader),
          queryParameters: params,
          data: payload)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      printResponse(url, "${globalHeader ?? ""}", "$body", "$response");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //DELETE

  Future<dynamic> delete({required String url}) async {
    log("checking delete URL == $url , $globalHeader");
    try {
      var response = await Dio()
          .delete(
        url,
        options: Options(headers: globalHeader),
      )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      // printResponse(url, "${globalHeader ?? ""}", "$body", "$response");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //MULTIPART FOR MULTIPLE FILE UPLOAD

  Future<dynamic> multipartRequest({
    required String url,
    Map<String, dynamic>? params,
    required Map<String, dynamic> body,
    String? fileKey,
    List<String>? docFileList,
  }) async {
    String? filepath;
    var formData = FormData.fromMap(body);
    for (var files in docFileList!) {
      filepath = files;
      formData.files.addAll(
          [MapEntry("files[]", await MultipartFile.fromFile(filepath))]);
    }

    try {
      var response = await Dio()
          .post(
        url,
        options: Options(headers: globalHeader),
        queryParameters: params,
        data: formData,
      )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      printResponse(url, "$globalHeader ", "$body", "$response");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  //MULTIPART FOR SINGLE FILE UPLOAD

  Future<dynamic> multipartSingleFile(
      {required String url,
        Map<String, dynamic>? params,
        Map<String, dynamic>? body,
        String? filepath,
        required String key}) async {
    var formData = FormData.fromMap(body ?? {});
    if (filepath != null) {
      formData.files.add(MapEntry(key, await MultipartFile.fromFile(filepath)));
    }

    try {
      var response = await Dio()
          .put(
        url,
        options: Options(headers: globalHeader),
        queryParameters: params,
        data: formData,
      )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      printResponse(url, "$globalHeader ", "$body", "$response");
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  void printResponse(String url, String header, String body, String response) {
    log("URL : $url ");
    log("HEADER : $header ");
    log("BODY : $body ");
    log("RESPONSE : $response ");
  }
}
