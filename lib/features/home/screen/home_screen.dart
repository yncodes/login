import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/core/theme/color_schemes.dart';
import 'package:login/features/auth/logout/logout_controller/logout_controller.dart';
import 'package:badges/badges.dart' as badges;
import '../../../core/db/shared_preference_utils.dart';
import '../../posts/posts_screen/posts_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController().obs;

    return GetBuilder<LogoutController>(
        init: LogoutController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              leading: badges.Badge(
                position: badges.BadgePosition.topEnd(top: 10, end: 10),
                child: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
              title: Text('Badges Demo'),
              actions: <Widget>[
              ],

              automaticallyImplyLeading: false,

            ),
            body: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: lightColorScheme.background,
                      borderRadius: BorderRadius.circular(80)),
                  height: 40,
                  alignment: Alignment.center,
                  child: const Text(
                    'Profile',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                CircleAvatar(
                  radius: 85,
                  child: ClipOval(
                      child: Image.network(
                    'https://media-cldnry.s-nbcnews.com/image/upload/rockcms/2023-07/230703-tesla-al-1145-b37eb9.jpg',
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Name : ',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            SharedPresUtil.getUserName(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            print(SharedPresUtil.getUserName());
                            print("=================");
                            Get.dialog(
                              barrierDismissible: false,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Container(
                                      decoration: const BoxDecoration(

                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Material(
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 10),
                                              TextFormField(
                                                controller:
                                                    nameController.value,
                                              ),
                                              const SizedBox(height: 20),
                                              //Buttons
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        minimumSize:
                                                            const Size(0, 45),
                                                        primary: Colors.amber,
                                                        onPrimary: const Color(
                                                            0xFFFFFFFF),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: const Text(
                                                        'No',
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        minimumSize:
                                                            const Size(0, 45),
                                                        primary: Colors.amber,
                                                        onPrimary: const Color(
                                                            0xFFFFFFFF),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        SharedPresUtil
                                                            .storeUserName(
                                                                nameController
                                                                    .value
                                                                    .text);
                                                        print(nameController
                                                            .value.text);
                                                        Get.back();
                                                      },
                                                      child: const Text(
                                                        'Yes',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Address : ',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 16),
                          ),
                          Text(
                            'Ipoask Kqudhuioh',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Email : ',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 16),
                          ),
                          Text(
                            'Ipoask Kqudhuioh',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Password : ',
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 16),
                          ),
                          Text(
                            'Ipoask Kqudhuioh',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                          ))
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const PostsScreen());
                    },
                    child: const Text('Posts'))
              ],
            ),
          );
        });
  }
}
