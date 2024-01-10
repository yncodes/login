import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:login/features/auth/signup/signup_controller/signuo_controller.dart';

import '../../../../core/theme/color_schemes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool isObscure = true.obs;
    return GetBuilder<SignUpController>(
        init: SignUpController(),
        builder: (controller) {
          return Obx(() => SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(fontSize: 20, letterSpacing: 2),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          color: lightColorScheme.inversePrimary,
                          borderRadius: BorderRadius.circular(25)),
                      margin: const EdgeInsets.only(
                          left: 30, right: 30, top: 10, bottom: 5),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: controller.nameController,
                              autovalidateMode: AutovalidateMode.always,
                              validator: FormBuilderValidators.required(),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: Icon(
                                  Icons.account_box,
                                  color: Colors.black,
                                ),
                                contentPadding: EdgeInsets.all(15),
                                hintText: 'Enter your name',
                              ),
                              //  controller: controller.emailController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: controller.emailController,
                              autovalidateMode: AutovalidateMode.always,
                              validator: FormBuilderValidators.email(),
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.email),
                                contentPadding: EdgeInsets.all(15),
                                hintText: 'Enter your email',
                              ),
                              //  controller: controller.emailController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: controller.passwordController,

                              autovalidateMode: AutovalidateMode.always,
                              validator: FormBuilderValidators.minLength(8),
                              obscureText: isObscure.value,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    color: Colors.black,
                                    onPressed: () {
                                      isObscure.toggle();
                                    },
                                    icon: Icon(
                                        isObscure.value == true ?
                                        FontAwesomeIcons.eye
                                            : FontAwesomeIcons.eyeSlash),
                                  ),

                                  contentPadding: const EdgeInsets.all(15),
                                  hintText: 'Enter your password',
                                  hintStyle: const TextStyle()),
                              // controller: controller.passwordController,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: controller.dobController,
                              autovalidateMode: AutovalidateMode.always,
                              validator: FormBuilderValidators.required(),
                              // obscureText: isObscure.value,
                              decoration: const InputDecoration(
                                  suffixIcon: Icon(FontAwesomeIcons.calendar,color: Colors.black,),
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: 'Date of Birth',
                                  hintStyle: TextStyle()),
                              // controller: controller.passwordController,
                            ),
                          ),
                        ],
                      ),
                    ),


                    Padding(
                      padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 12),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  lightColorScheme.inversePrimary)),
                          onPressed: () {
                            controller.signup();
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: lightColorScheme.tertiary),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ));
        });
  }
}
