import 'package:get/get.dart';
import 'package:login/features/home/screen/home_screen.dart';

import '../../../core/db/shared_preference_utils.dart';
import '../../auth/login/login_screen/login_screen.dart';


class SplashController extends GetxController{
  @override
  void onReady() async {
    startTime();
    super.onReady();
  }

  void startTime() async {
    Future.delayed(const Duration(seconds: 3), (){
      navigationPage();
    });
  }

  void navigationPage() async {
    if(SharedPresUtil.isUserLogged()) {
      Get.off(() => HomeScreen());
    } else {
      Get.off(()=> LoginScreen());
    }
  }
}