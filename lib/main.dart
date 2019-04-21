import 'package:flutter/material.dart';
import 'package:fluter_start/page/row.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Contents(),
      theme: new ThemeData(
        primaryColor: Colors.grey
      ),
    );
  }
}

class Contents extends StatelessWidget {
  final List<String> data = const ['rowPage', 'colPage'];

  skipPage(BuildContext context, String page) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      switch (page) {
        case 'rowPage':
          return new RowPage();
        default:
          return new RowPage();
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.builder(
          itemCount: data.length * 2,
          itemBuilder: (BuildContext context, int index) {
            if (index.isOdd || index > data.length) {
              return Divider();
            }
            final i = (index / 2).floor();
            return ListTile(
              title: Text(data[i], textAlign: TextAlign.center),
              onTap: () {
                skipPage(context, data[i]);
              },
            );
          }
      )
    );
  }
}

