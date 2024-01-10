import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:login/features/auth/login/login_controller/login_controller.dart';

import '../../../../core/theme/color_schemes.dart';
import '../../signup/signup_screen/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  bool _isValidEmail(String email) {
    RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    bool rememberMe = false;
    RxBool isObscure = true.obs;
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Obx(() => controller.isLoading == false
              ? Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text('Login'),
                  ),
                  body: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: lightColorScheme.primaryContainer,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25),
                            )),
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          children: [
                            TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              validator: FormBuilderValidators.email(),
                              decoration: const InputDecoration(

                                suffixIcon: Icon(Icons.email),
                                contentPadding: EdgeInsets.all(15),
                                hintText: 'Enter your email',
                              ),
                              controller: controller.emailController,
                            ),
                            TextFormField(
                              autovalidateMode: AutovalidateMode.always,
                              validator: FormBuilderValidators.minLength(8),
                              obscureText: isObscure.value,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    color: Colors.black,
                                    onPressed: () {
                                      isObscure.toggle();
                                    },
                                    icon: Icon(isObscure.value == true
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash),
                                  ),
                                  contentPadding: const EdgeInsets.all(15),
                                  hintText: 'Enter your password',
                                  hintStyle: const TextStyle()),
                              controller: controller.passwordController,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            Radio(
                              value: true,
                              groupValue: rememberMe,
                              onChanged: (value) {},
                            ),
                            Text('Remember Me'),
                          ],
                        ),
                      ),
                      FilledButton(
                          onPressed: () {
                            if (_isValidEmail(
                                controller.emailController.text)) {
                              controller.login();
                            } else {
                              Get.snackbar('Invalid Email',
                                  'Please enter your valid email',
                                  backgroundColor: lightColorScheme.primaryContainer);
                            }
                          },
                          child: const Text('Login')),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('You have no account?'),
                          TextButton(
                              onPressed: () {
                                Get.to(()=>const SignUpScreen());
                              }, child: const Text('Sign Up'))
                        ],
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ));
        });
  }
}
