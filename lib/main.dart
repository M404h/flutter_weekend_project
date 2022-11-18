import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screens/AuthScreen.dart';
import 'Screens/HomeScreen.dart';

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
  // final MinimumAppLaunchesCondition = '17/09/2022';
  // final RateMyApp rateMyApp = RateMyApp(
  //   minDays: 0,
  //   minLaunches: 2,
  //   remindLaunches: 10,
  //   remindDays: 5,
  //   // appStoreIdentifier:
  //   // googlePlayIdentifier:
  // );
  //
  // @override
  // void initState()  {
  //    rateMyApp.init().then((_) {
  //     rateMyApp.conditions.forEach((condition) {
  //       if (condition is DebuggableCondition) {
  //         print(condition.valuesAsString);
  //       }
  //     });
  //   });
  //
  //   if (rateMyApp.shouldOpenDialog) {
  //     rateMyApp.showRateDialog(context,
  //         title: 'Rate this app',
  //         // message:
  //         //     'If you like this app, please take a little bit of your time to review our app to help us improve it',
  //         rateButton: 'RATE',
  //         noButton: 'NO THANKS',
  //         laterButton: 'MAYBE LATER', onDismissed: () {
  //       rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed);
  //     });
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AuthScreen.id,
      routes: {
        AuthScreen.id: (context) => AuthScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}
