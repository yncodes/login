import 'package:flutter/material.dart';
import '../asset_manager.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  // final Color? backgroundColor;
  final Function() onTap;
  final bool? showBack;

  @override
  final Size preferredSize;

  const MainAppbar({
    // this.backgroundColor,
    Key? key,
    required this.onTap,
    this.showBack,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leadingWidth: 0,
      leading: Container(
        width: 0,
        color: Colors.black,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Image.asset(
        AssetManager.logoImage,
        height: 40,
      ),
    );
  }
}

class CircleCount extends StatelessWidget {
  final String count;
  const CircleCount({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      alignment: Alignment.topCenter,
      child: Center(
        child: Text(
          count,
          style: const TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class AppbarActionItem extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  final double? width;
  final double? height;

  const AppbarActionItem({
    Key? key,
    required this.imagePath,
    required this.onTap,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: SizedBox(
          width: width ?? 25,
          height: height ?? 25,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
