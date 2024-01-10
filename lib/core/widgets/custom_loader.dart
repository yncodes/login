import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoaderDialog extends StatelessWidget {
  const CustomLoaderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 150, // Set the width as per your requirement
        height: 150, // Set the height as per your requirement
        child: SizedBox(
          width: 100, // Set the width as per your requirement
          height: 100,
          child: LottieBuilder.asset(
            "assets/lottie_json/loader.json",
          ),
        ),
      ),
    );
  }
}
