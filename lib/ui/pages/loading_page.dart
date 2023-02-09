import 'package:animate_do/animate_do.dart';
import 'package:chronosmedic_app/data/controllers/app_controller.dart';
import 'package:chronosmedic_app/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:animate_do/animate_do.dart';

class LoadingPage extends GetView<AppController> {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: FadeInDown(
              controller: (controller) => AnimatedIcons.add_event,
              from: 5,
              duration: const Duration(seconds: 3),
              child: const Image(
                  image: AssetImage('assets/images/health-ai_logoVert.png')),
            ),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    print(await controller.isLoggedIn());
    await controller.isLoggedIn()
        ? Get.offNamed(AppRouters.home)
        : Get.offNamed(AppRouters.login);
  }
}
