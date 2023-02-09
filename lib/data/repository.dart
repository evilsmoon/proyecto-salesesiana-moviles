import 'package:chronosmedic_app/data/providers/object_box_provider.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Repository extends GetxController {
  static Repository get to => Get.find<Repository>();

  final ObjectBoxProvider objectBox;
  final SupabaseClient supabase;

  Repository({
    required this.objectBox,
    required this.supabase,
  });
}
