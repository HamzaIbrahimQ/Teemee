import 'package:flutter/material.dart';
// import 'package:teemee/injections.dart';
// import 'package:flutter/services.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'App/App.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initInjections();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await Firebase.initializeApp();
  await Future.delayed(Duration(milliseconds: 500));
  runApp(App());
}
