import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smt_machine_test/Screens/splash_screen.dart';
import 'Helpers/local_storage_helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crick Bro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
