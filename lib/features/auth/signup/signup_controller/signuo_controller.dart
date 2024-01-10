import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login/core/networking/apis.dart';
import 'package:login/features/auth/login/login_screen/login_screen.dart';
import 'package:login/features/auth/signup/signup_model/SignUpModel.dart';
import '../../../../core/networking/api_exceptions.dart';
import '../../../../core/networking/dio_client.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../otp/otp_screen/otp_screen.dart';

class SignUpController extends GetxController{
  RxBool isLoading = false.obs;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController();
  void signup() async{
    try{
      isLoading.toggle();
      final response = await DioClient().post(
          url: Apis.signup,
          body: {
            "name" : nameController.text,
            "email": emailController.text,
            "password" : passwordController.text,
            "dateOfBirth": dobController.text,
          });
      if(response != null){
        final result = SignUpModel.fromJson(response);
        if(result.success == true) {
          isLoading.toggle();
          //SharedPresUtil.storeUserAccessToken(result.data?.accessToken ?? '');
          print(response);
          Get.to(()=> const OTPScreen());
        } else {
          Get.offAll(() => const LoginScreen());
        }
      }
    } on DioException catch (exception){
      var errorText = DioExceptions.fromDioError(exception).toString();
      CustomSnackBar.showCustomErrorSnackBar(message: errorText);
    }
  }
}