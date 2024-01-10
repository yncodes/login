import 'package:login/utils/app_constant.dart';

import '../../main.dart';

class SharedPresUtil {
  static storeUserName(String name){
    prefs?.setString(AppConstant.userName, name);
  }

  static String getUserName() {
    return prefs?.getString(AppConstant.userName) ?? '';
  }

  static storeUserAccessToken(String token){
    prefs?.setString(AppConstant.userAccessToken, token);
  }

  static String getUserAccessToken() {
    return prefs?.getString(AppConstant.userAccessToken) ?? '';
  }

  static bool isUserLogged() {
    if(getUserAccessToken() == '') {
      return false;
    } else {
      return true;
    }
  }
}