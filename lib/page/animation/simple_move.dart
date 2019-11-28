import 'package:flutter/material.dart';

class SimpleMovePage extends StatefulWidget {
  @override
  _SimpleMovePageState createState() => _SimpleMovePageState();
}

class _SimpleMovePageState extends State<SimpleMovePage> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this
    );

    _animation = new Tween(begin: 0.0, end: 320.0)
      .animate(_controller)
      ..addListener(() {
        setState(()=>{});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('简单移动'),),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: _animation.value,
              child: Container(
                width: 36,
                height: 36,
                color: Colors.red,
              ),
            ),
            // MovedContainer(animation: _animation),
            // AnimatedBuilder(
            //   animation: _animation,
            //   child: Container(
            //     width: 36,
            //     height: 36,
            //     color: Colors.red,
            //   ),
            //   builder: (_, child) {
            //     return Positioned(
            //       top: 0,
            //       left: _animation.value,
            //       child: child,
            //     );
            //   },
            // ),
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

/// 只做了一点微小的工作，把 addListener抽取了出来
class MovedContainer extends AnimatedWidget {
  MovedContainer({
    Key key,
    Animation animation
  }): super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Positioned(
      top: 0,
      left: animation.value,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }
}