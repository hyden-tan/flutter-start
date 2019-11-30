import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


class FrictionTween extends Tween<double> {
  double friction;
  double v;

  FrictionTween({
    double begin,
    double end,
    this.friction = 0.08,
    this.v = 22,
  }): super(begin: begin, end: end);


  @override
  double lerp(t) {
    assert(begin != null);
    assert(end != null);

    return begin;
  }
}

Function requestAnimationFrame(
  Function(Duration) callback
) {
  assert(callback is Function);

  final _ticker = Ticker(callback);
  _ticker.start();

  return () {
    _ticker.stop();
    _ticker.dispose();
  };
}

