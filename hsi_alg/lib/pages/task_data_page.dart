import 'package:flutter/material.dart';

import '../models/task.dart';
class TaskDatas extends StatefulWidget {
  final Task task;

  const TaskDatas({super.key, required this.task});

  @override
  State<TaskDatas> createState() => _TaskdataState();
}

class _TaskdataState extends State<TaskDatas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task data'),
      ),
    );
  }
}
