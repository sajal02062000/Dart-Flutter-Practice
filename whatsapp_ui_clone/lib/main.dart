import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui_clone/Providers/cart_provider.dart';

import 'Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        title: 'Whatsapp UI Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const SplashScreen(),
      ),
    );
  }
}


// state management providers
// 1. "Easiest" Get (GetX) [Routing, Contextless state management, Alerts, Toaster, Bottom Sheet, Dependency injection, State management] {getx, get_storage, MVC}
// 2. "Medium" Provider [State management, uses with context] {shared_refrences, MVVM}
// 3. "Tough" Bloc/ Cubit [State management, uses with context] {shared_refrences, Bloc Architecture}
// 4. "-" Riverpod [State management, Contextless state managent] {shared_refrences, ?}