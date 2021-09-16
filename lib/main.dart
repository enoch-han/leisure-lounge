import 'package:flutter/material.dart';
import 'package:leisurelounge/bloc/bloc.dart';
import './screens/screens.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import './utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization;
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: SignInProvider.init()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leisure Lounge',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.black),
      home: AppScreensController(),
    );
  }
}

class AppScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignInProvider authProvider = Provider.of<SignInProvider>(context);
    switch (authProvider.status) {
      case Status.Uninitialized:
        //return SignInScreen();
        //temp should be removed after testing
        return NavigationScreen();
      case Status.Unauthenticated:
      case Status.Authenticating:
        //return SignInScreen();
        //temp should be removed after testing
        return NavigationScreen();
      case Status.Authenticated:
        return NavigationScreen();
      default:
        return SignInScreen();
    }
  }
}
