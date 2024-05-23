import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello world',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello world'),
        ),
        body: Center(
          child: Text(
            'hello world',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}