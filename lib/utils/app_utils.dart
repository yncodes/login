import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class AppUtils {
  static final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');

  static bool isEmailValid(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static bool validateStructure(String value) {
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isNumeric(String data) {
    if (data == "") {
      return false;
    }
    return double.tryParse(data) != null;
  }

  static String dateFormat(DateTime? date) {
    try {
      if (date == null) return '';
      return DateFormat('EEE, MMM d').format(date);
    } catch (e) {
      return "";
    }
  }

  static String dateFormatFull(DateTime? date) {
    try {
      if (date == null) return '';
      return DateFormat('d MMM yyyy').format(date);
    } catch (e) {
      return "";
    }
  }

  static String onlyMonth(String? date) {
    try {
      if (date == null) return '';
      return DateFormat('MMMM').format(DateTime.parse(date));
    } catch (e) {
      return "";
    }
  }

  static String onlyDate(String? date) {
    try {
      if (date == null) return '';
      return DateFormat('d').format(DateTime.parse(date));
    } catch (e) {
      return "";
    }
  }

  static String dateFormatFullDay(DateTime? date) {
    try {
      if (date == null) return '';
      return DateFormat('EEEE, d MMM').format(date);
    } catch (e) {
      return "";
    }
  }

  static String timeFormat(DateTime? date) {
    try {
      if (date == null) return '';
      return DateFormat.jm().format(date);
    } catch (e) {
      return "";
    }
  }

  static String dateTimeFormatFull(DateTime? date) {
    try {
      if (date == null) return '';
      return DateFormat('yyyy-MM-dd \n kk:mm a').format(date);
    } catch (e) {
      return "";
    }
  }

  static String timeFormatForWeb(DateTime? date) {
    try {
      if (date == null) return '';
      return DateFormat("Hms").format(date);
    } catch (e) {
      return "";
    }
  }

  static bool isMobileNumberValid(String phone) {
    return RegExp(r'^\+?\d+$').hasMatch(phone);
  }

  static String priorityName(int value) {
    if (value == 1) {
      return "high";
    }
    if (value == 2) {
      return "medium";
    }
    if (value == 3) {
      return "low";
    }
    return "high";
  }

  static int priorityValue(String value) {
    if (value == "high") {
      return 1;
    }
    if (value == "medium") {
      return 2;
    }
    if (value == "low") {
      return 3;
    }
    return 1;
  }

  static String getOnlyDate(DateTime date) {
    String result = DateFormat('yyyy-MM-dd').format(date);

    return result;
  }

  String deviceType() {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return "android";
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return "ios";
    } else {
      return "";
    }
  }
}
