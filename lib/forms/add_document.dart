import 'package:border_leg/providers/document.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddDocument extends StatefulWidget {
  static const routeName = '/add_document';

  @override
  _AddDocumentState createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  final _form = GlobalKey<FormState>();
  DateTime selectedDay;
  String dropdownValue = 'Закон України';

  @override
  Widget build(BuildContext context) {
    TextEditingController _txtFormCtrl;
    Document newDocumet;
    Map<String, String> _tempDocument = {
      'title': '',
      'publisher': '',
      'type': '',
      'date': '',
      'link': '',
    };
    void saveForm() {
      _form.currentState.save();
      newDocumet = Document(
          title: _tempDocument['title'],
          publisher: _tempDocument['publisher'],
          type: dropdownValue,
          date: selectedDay,
          link: _tempDocument['link']);
      print(newDocumet.toString());
      Navigator.of(context).pop();

    }

    void _presentDatePicker() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1989),
        lastDate: DateTime.now(),
      ).then((value) {
        setState(() {
          print('!!!!!!' + value.toString());
          selectedDay = value;
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Додати документ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Тип документу',
                    style: TextStyle(color: Colors.grey),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Закон України',
                      'ПКМУ',
                      'НАКАЗ АДПСУ',
                      'НАКАЗ МВС'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Назва"),
                maxLines: 2,
                textInputAction: TextInputAction.next,
                onSaved: (newValue) => _tempDocument['title'] = newValue,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Видавник"),
                textInputAction: TextInputAction.next,
                onSaved: (newValue) => _tempDocument['publisher'] = newValue,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text('Дата видавництва:'),
                      Text(
                        selectedDay == null
                            ? ' '
                            : DateFormat.yMMMMd()
                                .format(selectedDay)
                                .toString(),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                  FlatButton(
                    child: Text(
                      'Оберіть дату',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green),
                    ),
                    onPressed: () {
                      _presentDatePicker();
                    },
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Посилання"),
                textInputAction: TextInputAction.next,
                onSaved: (newValue) => _tempDocument['link'] = newValue,
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                child: RaisedButton(
                  //color: Theme.of(context).primaryColor,
                  color: Colors.green,
                  onPressed: () => saveForm(),
                  child: Text('Додати'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
