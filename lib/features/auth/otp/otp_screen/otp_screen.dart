import 'package:flutter/material.dart';
import 'package:login/core/theme/color_schemes.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(color: lightColorScheme.inversePrimary, child: Text(' OTP Verification ', style: TextStyle(fontSize: 25),))
            ],
          ),
        ),
      ),
    );
  }
}
