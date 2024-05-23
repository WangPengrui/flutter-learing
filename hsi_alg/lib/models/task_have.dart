import 'package:flutter/material.dart';

import 'task.dart';

class TaskHave extends ChangeNotifier {

  final List<Task> _taskList = [
    Task(name: 'Unmixing', imagePath: "lib/images/Unmixing.png",description: 'Hyperspectral Unmixing is a procedure that decomposes the measured pixel spectrum of hyperspectral data into a collection of constituent spectral signatures (or endmembers) and a set of corresponding fractional abundances. Hyperspectral Unmixing techniques have been widely used for a variety of applications, such as mineral mapping and land-cover change detection.',),
    Task(name: 'Classification', imagePath: "lib/images/classification.jpg",description:"test Classification"),
    Task(name: 'Detection', imagePath: "lib/images/Detection.png",description:"test Detection"),
    Task(name: 'Denoising', imagePath: "lib/images/Denoising.png",description:"test Denoising"),
    Task(name: 'Merge', imagePath: "lib/images/Merge.png",description:"test Merge")
  ];
  // favorate Task
  List<Task> _favorate = [];

  // getter methods
  List<Task> get taskList => _taskList;
  List<Task> get favorate => _favorate;

  // to favorate
  void addToFavorate(Task task) {
    _favorate.add(task);
    notifyListeners();
  }

  // remove from cart

  void removeFromFavorate(Task task) {
    favorate.remove(task);
    notifyListeners();
  }
}
