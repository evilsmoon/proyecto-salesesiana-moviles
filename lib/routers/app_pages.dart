import 'package:chronosmedic_app/ui/pages/loading_page.dart';
import 'package:chronosmedic_app/ui/pages/nav_bar_page.dart';
import 'package:get/get.dart';
import 'package:chronosmedic_app/ui/pages/pages.dart';
import 'package:chronosmedic_app/routers/routers.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRouters.loading,
      page: () => const LoadingPage(),
      binding: AppBinding(),
    ),
    GetPage(
      name: AppRouters.login,
      page: () => const LoginPage(),
      binding: AppBinding(),
    ),
    // GetPage(
    //   name: AppRouters.home,
    //   page: () => const HomePage(),
    //   binding: AppBinding(),
    // ),
    GetPage(
        name: AppRouters.home,
        page: () => NavBarPage(
              initialPage: 'homePage',
            ),
        binding: AppBinding())
  ];
}
