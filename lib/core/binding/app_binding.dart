import 'package:get/get.dart';

import '../../features/posts/repository/post_repository_impl.dart';

class AppBinding extends Bindings {
  @override
  void dependencies(){
    Get.put(PostRepositoryImpl());
  }
}