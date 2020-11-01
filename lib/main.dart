import 'package:border_leg/forms/add_document.dart';
import 'package:border_leg/screens/legislation_screen.dart';
import 'package:border_leg/screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
        routes: {
          LegislationScreen.routeName: (ctx) => LegislationScreen(),
          AddDocument.routeName: (ctx) => AddDocument(),
        }
    );
  }
}

