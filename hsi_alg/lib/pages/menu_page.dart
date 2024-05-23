import 'package:flutter/material.dart';
import 'package:hsi_alg/pages/task_algorithm_page.dart';
import 'package:provider/provider.dart';
import '../components/task_tile.dart';
import '../models/task.dart';
import '../models/task_have.dart';
import 'task_data_page.dart';
import 'task_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // List task
  // List taskList = [
  //   Task(name: 'Unmixing', imagePath: "lib/images/Unmixing.png",description: 'Hyperspectral Unmixing is a procedure that decomposes the measured pixel spectrum of hyperspectral data into a collection of constituent spectral signatures (or endmembers) and a set of corresponding fractional abundances. Hyperspectral Unmixing techniques have been widely used for a variety of applications, such as mineral mapping and land-cover change detection.',),
  //   Task(name: 'Classification', imagePath: "lib/images/classification.jpg",description:"test Classification"),
  //   Task(name: 'Detection', imagePath: "lib/images/Detection.png",description:"test Detection"),
  //   Task(name: 'Denoising', imagePath: "lib/images/Denoising.png",description:"test Denoising"),
  //   Task(name: 'Merge', imagePath: "lib/images/Merge.png",description:"test Merge")
  // ];

  // 显示任务简介
  void navigateToTaskDetails(int index) {
    final taskHave = context.read<TaskHave>();
    final taskList = taskHave.taskList;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDetail(
          task: taskList[index],
        ),
      ),
    );
  }

  // 显示任务数据
  void navigateToTaskData(int index) {
    final taskHave = context.read<TaskHave>();
    final taskList = taskHave.taskList;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskDatas(
          task: taskList[index],
        ),
      ),
    );
  }

  // 显示任务算法
  void navigateToTaskAlgorithm(int index) {
    final taskHave = context.read<TaskHave>();
    final taskList = taskHave.taskList;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TaskAlgorithms(),
      ),
    );
  }

  // 构建页面
  @override
  Widget build(BuildContext context) {
    final taskHave = context.read<TaskHave>();
    final taskList = taskHave.taskList;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'WHICH TASK?',
          style: TextStyle(color: Colors.grey[900]),
        ),
        centerTitle: true, // 设置标题居中
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.grey[900],
        // ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) => TaskTile(
                task: taskList[index],
                onTapOut: () => navigateToTaskDetails(index),
                onTapData: () => navigateToTaskData(index),
                onTapAlgorithm: () => navigateToTaskAlgorithm(index),
              ),
            ),
          )
        ],
      ),
    );
  }
}
