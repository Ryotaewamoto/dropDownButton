import 'package:flutter/material.dart';
import 'package:flutter_drop_down_button/dropDownButtonModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DropDownButtonModel>(
          create: (_) => DropDownButtonModel(),
        ),
      ],
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<DropDownButtonModel>();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ドロップダウンボタン'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              DropdownButton<String>(
                  value: model.text.isNotEmpty ? model.text : 'a',
                  onChanged: (newValue) {
                    model.text = newValue;
                  },
                  items: <String>[
                    'a',
                    'b',
                    'c',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
