import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/widgets/custom_loader.dart';
import '../core/widgets/custom_margin.dart';

class DialogHelper {
  //show error dialog
  static void showErrorDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineMedium,
              ),
              Text(
                description ?? '',
                style: Get.textTheme.titleLarge,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show error dialog
  static void deleteDialog({
    String title = 'Error',
    String? description = 'Something went wrong',
    required Function() onTap,
  }) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Delete",
                style: Get.textTheme.titleLarge,
              ),
              //const VerticalMargin(),
              const Text(
                "Are you sure you want to remove from my list?",
              ),
              //const VerticalMargin(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Cancel",
                      )),
                  TextButton(
                      onPressed: onTap,
                      child: const Text(
                        "Ok",
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // animated dialog

  static void animatedDialog({
    required BuildContext context,
    required Widget child,
  }) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.8),
        transitionBuilder: (context, a1, a2, widget) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.4, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.4, end: 1.0).animate(a1),
              child: widget,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return SafeArea(
            child: Dialog(
                backgroundColor: Colors.white,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                insetPadding: const EdgeInsets.all(24),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0))),
                child: child),
          );
        });
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () async => false,
        child: const CustomLoaderDialog(),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }

    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}
