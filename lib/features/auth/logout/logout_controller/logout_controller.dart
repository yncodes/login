import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:login/core/networking/dio_client.dart';
import 'package:login/features/auth/login/login_screen/login_screen.dart';

import '../../../../core/networking/api_exceptions.dart';
import '../../../../utils/custom_snackbar.dart';
import '../logout_model/LogoutModel.dart';

class LogoutController extends GetxController{
  RxBool isLoading = false.obs;
  void response() async {
    try{
      final response = await DioClient().get(url: 'http://172.16.10.153:3000/api/v1/user/logout');
      if(response != null){
        final result =  LogoutModel.fromJson(response);
        if(result.success == false) {
          Get.to(()=> const LoginScreen());
        }
      }
    } on DioException catch (exception){
      var errorText = DioExceptions.fromDioError(exception).toString();
      CustomSnackBar.showCustomErrorSnackBar(message: errorText);
    }

  }
}