import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:login/core/db/shared_preference_utils.dart';

class BaseController extends GetxController{
  void handleError(DioException error) async {
    if(error.response?.statusCode == 401) {
      // await SharedPresUtil.removeUser
    }
  }
}