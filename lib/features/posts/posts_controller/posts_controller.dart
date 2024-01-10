import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login/core/networking/apis.dart';
import 'package:login/core/networking/dio_client.dart';
import '../../../core/networking/api_exceptions.dart';
import '../../../utils/custom_snackbar.dart';
import '../posts_model/PostsModel.dart';

class PostsController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLastPage = false.obs;

  RxList posts = [].obs;
  RxInt pageNumber = 1.obs;
 // RxInt limit = 10.obs;

  var listOffset = 0.0.obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    response();
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      response();
    }
  }

  @override
  void onReady() async {
    response();
    super.onReady();
  }

  void response() async {
    isLoading.value = true;
    listOffset.value =
        scrollController.hasClients ? scrollController.position.pixels : 0.0;
    try {
      final response = await DioClient()
          .get(url: '${Apis.posts}_page=${pageNumber.value}&_limit=10');

      if(response != null && response != []){
        print(response);
        print('============');
        response.forEach((item) {
          final element = PostsModel.fromJson(item);
          posts.add(element);
        });
      }

      if(response == [] || response == null || response == '') {
        isLastPage.toggle();
        isLoading = RxBool(false);
      }

      WidgetsBinding.instance?.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          scrollController.jumpTo(listOffset.value);
        }
      });
      pageNumber.value++;
      isLoading.value = false;
      // }
    } on DioException catch (exception) {
      var errorText = DioExceptions.fromDioError(exception).toString();
      CustomSnackBar.showCustomErrorSnackBar(message: errorText);
    }
  }
}
