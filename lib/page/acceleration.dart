import 'dart:async';

import 'package:fluter_start/utils/index.dart';
import 'package:flutter/material.dart';

class AccelerationPage extends StatefulWidget {
  @override
  _AccelerationPageState createState() => _AccelerationPageState();
}


/// 目标值
const TARGET_RIGHT = 250.0; 
/// 弹性系数
const SPRING = 0.01;
/// 摩擦系数
const FRICTION_FACTOR = 0.005;

class _AccelerationPageState extends State<AccelerationPage> {

  double _right = 0.0;
  double _v = 0.0;

  Function _cancelFrame;

  _playFactor() {
    // Timer.periodic(Duration(milliseconds: 16), (timer) {
    //   final s = RIGHT_END - _right;
    //   _v = s * FRICTION_FACTOR;
    //   _right += _v;
    //   if (_v <= 0.01) {
    //     timer.cancel();
    //   }
    //   setState(() {});
    // });


    _cancelFrame = requestAnimationFrame((_) {
      final dx = (TARGET_RIGHT / 2) - _right;
      final ax = dx * SPRING;
      _v += ax;
      // _v *= (1 - FRICTION_FACTOR);
      _right += _v;
      // if (_v.abs() <= 0.01) {
      //   _cancelFrame();
      // }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('摩擦力'),),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: _right,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 120,
              right: 20,
              child: GestureDetector(
                onTap: _playFactor,
                child: Container(
                  width: 50,
                  height: 36,
                  color: Colors.blue,
                  child: Center(child: Text('播放', style: TextStyle(
                    color: Colors.white
                  ),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
