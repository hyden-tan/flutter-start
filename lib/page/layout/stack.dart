/**
 * Wrap用于流式布局
 * */

import 'package:flutter/material.dart';

class StackPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Wrap Demo'),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          alignment:Alignment.bottomCenter , //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              top: 30,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}
