import 'package:flutter/material.dart';

class RowPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Row Demo'),
      ),
      body: new Row(
        children: <Widget>[
          Text('明月几时有'),
          Text('把酒问青天')
        ],
      ),
    );
  }
}