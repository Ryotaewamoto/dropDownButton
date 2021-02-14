import 'package:flutter/material.dart';

class DropDownButtonModel extends ChangeNotifier {
  String _defaultValue = '好きな色をしてください';
  String _text = '';

  // リストアイテム
  List<String> _list = <String>[
    '好きな色をしてください',
    'red',
    'blue',
    'green',
    'yellow',
    'pink',
    'grey',
    'white',
    'black',
    'orange',
    'lime',
  ];

  get defaultValue => _defaultValue;
  get list => _list;
  get text => _text;

  set text(String newValue) {
    _text = newValue;
    notifyListeners();
  }
}
