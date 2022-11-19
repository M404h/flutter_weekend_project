import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_weekend_project/Screens/BudgetDivider.dart';
import 'package:flutter_weekend_project/Screens/CategoryDetails.dart';
import 'package:flutter_weekend_project/Screens/CategoryDetailsManual.dart';
import 'Screens/AuthScreen.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/TravelHome.dart';

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
      theme: new ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),

        initialRoute: HomeScreen.id,
        routes: {
          AuthScreen.id: (context) => AuthScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          TravelHome.id: (context) => TravelHome(),
          BudgetDivider.id: (context) => BudgetDivider(),
          CategoryDetails.id: (context) => CategoryDetails(),
          CategoryDetailsManual.id: (context) => CategoryDetailsManual()
        },
      ),
    );
  }
}
