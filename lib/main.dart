import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/AuthScreen.dart';
import 'Screens/HomeScreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        initialRoute: AuthScreen.id,
        routes: {
          AuthScreen.id: (context) => AuthScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        },
      ),
    );
  }
}
