import 'dart:async';

import 'package:fluter_start/utils/index.dart';
import 'package:flutter/material.dart';

class FrictionMovePage extends StatefulWidget {
  @override
  _FrictionMovePageState createState() => _FrictionMovePageState();
}

const INITIAL_V = 32.0;
const FRICTION = 2;
const FRICTION_FACTOR = 0.08;

const RIGHT_END = 320.0; 

class _FrictionMovePageState extends State<FrictionMovePage> {

  double _right = 0.0;
  double _v;
  double _friction;
  double dir = -1;

  Function _cancelFrame;



  initState() {
    super.initState();

    // Timer.periodic(Duration(milliseconds: 1000), (_) {
    //   print('我在执行Timer');
    // });
    // requestAnimationFrame((_) {
    //   print('我在执行requestAnimationFrame');
    // });
  }

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
      final s = RIGHT_END - _right;
      _v = s * FRICTION_FACTOR;
      _right += _v;
      if (_v <= 0.01) {
        _cancelFrame();
      }
      setState(() {});
    });
  }

  _playNomal() {
    dir = -dir;
    _v = dir * INITIAL_V;
    _friction = dir * FRICTION;

    Timer.periodic(Duration(milliseconds: 16), (timer) {
        _right += _v;
        _v -= _friction;
        if (_v.abs() <= 0.1) {
          timer.cancel();
        }
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
                width: 36,
                height: 36,
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
