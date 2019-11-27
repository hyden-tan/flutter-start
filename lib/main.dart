import 'package:fluter_start/page/acceleration.dart';
import 'package:fluter_start/page/friction_move.dart';
import 'package:fluter_start/page/simple_move.dart';
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
  final List<String> data = const ['simpleMove', 'frictionMove', 'accelerationMove'];

  skipPage(BuildContext context, String page) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      switch (page) {
        case 'simpleMove':
          return SimpleMovePage();
        case 'frictionMove':
          return FrictionMovePage();
        case 'accelerationMove':
          return AccelerationPage();
        // case 'column':
        //   return new ColumnPage();
        // case 'wrap':
        //   return new WrapPage();
        // case 'stack':
        //   return new StackPage();
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
            if (index.isOdd) {
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

