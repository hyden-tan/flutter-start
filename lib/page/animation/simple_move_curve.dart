import 'package:flutter/material.dart';

class CurveSimpleMovePage extends StatefulWidget {
  @override
  _CurveSimpleMovePageState createState() => _CurveSimpleMovePageState();
}

class _CurveSimpleMovePageState extends State<CurveSimpleMovePage> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this
    );

    final _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut
    );

    _animation = Tween(begin: 0.0, end: 320.0)
      .animate(_curve);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('使用Curve移动'),),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: _animation,
              child: Container(
                width: 36,
                height: 36,
                color: Colors.red,
              ),
              builder: (_, child) {
                return Positioned(
                  top: 0,
                  left: _animation.value,
                  child: child,
                );
              },
            ),
            Positioned(
              top: 120,
              right: 20,
              child: GestureDetector(
                onTap: () => _controller.forward(),
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
    _controller.dispose();
    super.dispose();
  }
}