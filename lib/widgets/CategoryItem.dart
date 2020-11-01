import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final title;
  final onTapRouteName;


  CategoryItem(this.title, this.onTapRouteName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, onTapRouteName);
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 2, top: 2),
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0,126,255,1),
                Color.fromRGBO(255,250,57, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 1],
            ),
            borderRadius: BorderRadius.circular(10),
            //color: Colors.yellow,
            border: Border.all(width: 2, color: Colors.grey)),
        child: Text(
          '$title',
          style: TextStyle(fontSize: 20,color: Colors.black54),
        ),
      ),
    );
  }
}
