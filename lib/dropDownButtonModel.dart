import 'package:flutter/material.dart';

class DropDownButtonModel extends ChangeNotifier {
  String _defaultValue = 'a';
  // リストアイテム
  List<String> _list = <String>[
    'a',
    'b',
    'c',
  ];
  String _text = '';

  get defaultValue => _defaultValue;
  get list => _list;
  get text => _text;

  set text(String newValue) {
    _text = newValue;
    notifyListeners();
  }
}
