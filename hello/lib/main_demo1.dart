import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello world'),
        ),
        body: Center(
          child: Text(
            'Hello world',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}