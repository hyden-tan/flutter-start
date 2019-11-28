import 'package:fluter_start/page/animation/acceleration.dart';
import 'package:fluter_start/page/animation/friction_move.dart';
import 'package:fluter_start/page/animation/simple_move.dart';
import 'package:fluter_start/page/animation/simple_move_curve.dart';
import 'package:fluter_start/page/animation/springPhysics.dart';
import 'package:flutter/material.dart';

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
  final List<String> data = const [
    'simpleMove',
    'curveSimpleMove',
    'frictionMove',
    'accelerationMove',
    'physicsCardDrag',
  ];

  skipPage(BuildContext context, String page) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      switch (page) {
        case 'simpleMove':
          return SimpleMovePage();
        case 'frictionMove':
          return FrictionMovePage();
        case 'accelerationMove':
          return AccelerationPage();
        case 'curveSimpleMove':
          return CurveSimpleMovePage();
        case 'physicsCardDrag':
          return PhysicsCardDragPage();
        default:
          return Container();
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

