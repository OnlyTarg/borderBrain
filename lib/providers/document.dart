



import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class Document with ChangeNotifier {
  final String title;
  final String publisher;
  final String type;
  final DateTime date;
  final String link;

  Document({this.title, this.publisher, this.type, this.date, this.link});

  @override
  String toString() {
    return '$title $publisher $type ${DateFormat.yMMMMd()
        .format(date)}  $link';
  }
}
