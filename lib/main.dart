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
                model.text.isNotEmpty ? model.text : model.defaultValue,
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
              DropdownButton<String>(
                  value:
                      model.text.isNotEmpty ? model.text : model.defaultValue,
                  onChanged: (newValue) {
                    model.text = newValue;
                  },
                  items:
                      model.list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
              FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
