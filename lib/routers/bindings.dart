import 'package:chronosmedic_app/data/controllers/app_controller.dart';
import 'package:chronosmedic_app/data/repository.dart';
import 'package:chronosmedic_app/main.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(
      Repository(objectBox: objectbox, supabase: Supabase.instance.client),
    );

    Get.put<AppController>(
      AppController(
        respository: Repository.to,
      ),
    );
  }
}
