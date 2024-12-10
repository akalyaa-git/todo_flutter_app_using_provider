import 'package:flutter/material.dart';
import 'package:todo_flutter_app_using_provider/feature_todo/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _list = [];

  List<Task> get tasks => _list;

  void addTask(Task task){
    _list.add(task);
    notifyListeners();
  }

  void removeTask(Task task){
    _list.remove(task);
    notifyListeners();
  }

  void checkTask(int index){
    _list[index].isCompleted();
    notifyListeners();
  }
}