import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fmessenger/firebase_options.dart';
// ignore: unused_import
import 'package:fmessenger/pages/register_page.dart';
import 'package:fmessenger/services/auth/auth_gate.dart';
import 'package:fmessenger/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
