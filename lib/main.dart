import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logletter/firebase_options.dart';
import 'package:logletter/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logletter/theme/dark_mode.dart';
import 'package:logletter/theme/light_mode.dart';

void main() async {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your app lication.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'logletter',
      debugShowCheckedModeBanner: false,
      home: const LoadingLogin(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
