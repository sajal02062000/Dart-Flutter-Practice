import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui_clone/Providers/api_provider.dart';

import 'Helpers/notification_service.dart';
import 'Screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final NotificationService _notificationService = NotificationService();

/// Background notification handler
@pragma("vm:entry-point")
Future<void> _firebaseBackgroundNotificationsHandler(
  RemoteMessage remoteMessage,
) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (kDebugMode) {
    print("Background notification received: ${remoteMessage.notification}");
  }

  // Handle background notification data here if needed
  if (remoteMessage.notification != null && remoteMessage.data.isNotEmpty) {
    _notificationService.showNotification(
      remoteMessage.notification!,
      remoteMessage.data,
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(
    _firebaseBackgroundNotificationsHandler,
  );
  _notificationService.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then((
      RemoteMessage? remoteMessage,
    ) {
      if (remoteMessage?.data.isNotEmpty ?? false) {
        _notificationService.handleRouting(remoteMessage?.data ?? {});
      }
    });

    // Listen for foreground notifications
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (message.notification != null) {
        if (kDebugMode) {
          print('Foreground Notification: ${message.notification?.toMap()}');
        }
        _notificationService.showNotification(
          message.notification!,
          message.data,
        );
      }
    });

    // Handle notification taps when the app is in the background or terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      if (remoteMessage.data.isNotEmpty) {
        _notificationService.handleRouting(remoteMessage.data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ApiProvider())],
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