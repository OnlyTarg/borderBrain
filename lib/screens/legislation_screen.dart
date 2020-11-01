import 'package:border_leg/forms/add_document.dart';
import 'package:border_leg/widgets/CategoryItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LegislationScreen extends StatelessWidget {
  static const routeName = '/lagislation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BORDER - BRAIN'),
        centerTitle: true,
      ),
      //drawer: AppDrawer(),
      body: Column(
        children: [
          CategoryItem('Закони України', '/'),
          CategoryItem('Постанови КМУ', null),
          CategoryItem('Накази АДПСУ', null),
          CategoryItem('Обране', null),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed(AddDocument.routeName),

      ),
    );
  }
}
