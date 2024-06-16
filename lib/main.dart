import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:market/firebase_options.dart';
import 'package:market/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Configurar el manejo de notificaciones
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          'Notificación recibida en primer plano: ${message.notification!.title}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
          'Aplicación abierta desde una notificación: ${message.notification!.title}');
    });

    // Obtener el token de registro
    messaging.getToken().then((token) {
      print('Token de registro FCM: $token');
    });
    return MaterialApp.router(
      routerConfig: routerConfig,
    );
  }
}
