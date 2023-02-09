import 'package:chronosmedic_app/data/providers/object_box_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:chronosmedic_app/global/environment.dart';
import 'package:chronosmedic_app/routers/routers.dart';
import 'package:chronosmedic_app/theme/app_theme.dart';

late ObjectBoxProvider objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppTheme.initialize();

  await Supabase.initialize(
      url: Environment.SUPABASE_URL, anonKey: Environment.SUPABASE_ANON_KEY);

  objectbox = await ObjectBoxProvider.init();

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chronosmedic",
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: AppTheme.themeMode,
      initialRoute: AppRouters.loading,
      initialBinding: AppBinding(),
      getPages: AppPages.pages));
}
// import 'package:chronosmedic_app/global/environment.dart';
// import 'package:chronosmedic_app/theme/app_theme.dart';
// import 'package:chronosmedic_app/ui/pages/login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Supabase.initialize(
//       url: Environment.SUPABASE_URL, anonKey: Environment.SUPABASE_ANON_KEY);
//   await AppTheme.initialize();
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
//   static _MyAppState of(BuildContext context) =>
//       context.findRootAncestorStateOfType<_MyAppState>()!;
// }

// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _unfocusNode.dispose();
//     super.dispose();
//   }

//   void setThemeMode(ThemeMode mode) => setState(() {
//         _themeMode = mode;
//         AppTheme.saveThemeMode(mode);
//       });

//   ThemeMode _themeMode = AppTheme.themeMode;
//   final _unfocusNode = FocusNode();
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(brightness: Brightness.light),
//       darkTheme: ThemeData(brightness: Brightness.dark),
//       themeMode: _themeMode,
//       home: const LoginPage(),
//     );
//   }
// }

