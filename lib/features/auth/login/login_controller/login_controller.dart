import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login/core/db/shared_preference_utils.dart';
import 'package:login/features/auth/login/login_screen/login_screen.dart';
import 'package:login/features/home/screen/home_screen.dart';
import '../../../../core/networking/api_exceptions.dart';
import '../../../../core/networking/dio_client.dart';
import '../../../../utils/custom_snackbar.dart';
import '../login_model/login_model.dart';


class LoginController extends GetxController{
  RxBool isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  void login() async{
    try{
      isLoading.toggle();
      final response = await DioClient().post(
          url: 'https://big-blue-controller-45sie.ondigitalocean.app/api/v1/user/login',
          body: {
      "identifier" : emailController.text.toString(),
      "password": passwordController.text.toString(),
      });
      if(response != null){
        final result = LoginModel.fromJson(response);
        if(result.success == true) {
          isLoading.toggle();
          SharedPresUtil.storeUserAccessToken(result.data?.accessToken ?? '');
          Get.offAll(()=> const HomeScreen());
        } else {
          Get.offAll(() => LoginScreen());
        }
      }
    } on DioException catch (exception){
      var errorText = DioExceptions.fromDioError(exception).toString();
      CustomSnackBar.showCustomErrorSnackBar(message: errorText);
    }
  }
}