import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:temee_app/SplashScreen/SplashScreen.dart';
import 'package:temee_app/Style.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {


  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {

  }

  final GlobalKey<ScaffoldState> globalScaffold = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      builder: (context, child) => Scaffold(key: globalScaffold, body: child),
      home: SplashScreen(),
      theme: ThemeData(
        fontFamily: "Avenir",
        primaryColor: primaryColor,
      ),
    );
  }
}
