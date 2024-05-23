import 'package:flutter/material.dart';

class TaskAlgorithms extends StatefulWidget {
  const TaskAlgorithms({super.key});

  @override
  State<TaskAlgorithms> createState() => _TaskAlgorithmState();
}

class _TaskAlgorithmState extends State<TaskAlgorithms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Algorithms'),
      ),
    );
  }
}
