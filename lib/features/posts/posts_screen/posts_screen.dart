import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/core/theme/color_schemes.dart';
import 'package:login/features/posts/posts_controller/posts_controller.dart';

final bucketValue = PageStorageBucket();

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostsController>(
        init: PostsController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Post'),
              ),
              body: Obx(() => controller.posts.isEmpty ? const Center(child: CircularProgressIndicator(),) : PageStorage(
                  bucket: bucketValue,
                  child: ListView.builder(
                      key: PageStorageKey<int>(controller.pageNumber.value),
                      controller: controller.scrollController,
                      shrinkWrap: true,
                      itemCount: controller.posts.length,
                          //(controller.isLoading.value ? 1 : 0),
                      itemBuilder: (context, index) {
                        print(controller.posts.length);
                        print('%%%%%%%%');
                        // Display posts
                        return Column(children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: lightColorScheme.primaryContainer,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "User ID : "
                                        '${controller.posts[index].userId.toString()}',
                                    style: TextStyle(
                                        color: lightColorScheme.onSurface),
                                  ),
                                  Text("ID : "
                                      '${controller.posts[index].id.toString()}'),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Text("Title : "
                                      '${controller.posts[index].title.toString()}'),
                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  Text(
                                    "Body : "
                                        '${controller.posts[index].body.toString()}',
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          controller.isLastPage == true && controller.isLoading == false? Container()
                              :  controller.isLoading == false && controller.posts.length == index+1
                              ? loadingContainer() : Container()
                        ]);
                      }
                  ))));
        });
  }

  Widget loadingContainer() {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: lightColorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10)),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
