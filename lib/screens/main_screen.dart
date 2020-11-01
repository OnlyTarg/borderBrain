import 'package:border_leg/screens/legislation_screen.dart';
import 'package:border_leg/widgets/CategoryItem.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Border Brain'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CategoryItem('Законодавство', LegislationScreen.routeName),
          CategoryItem('АЮД', LegislationScreen.routeName),
          CategoryItem('ПОШУК', LegislationScreen.routeName),
          CategoryItem('Довідка', LegislationScreen.routeName),
        ],
      ),
    );
  }
}
