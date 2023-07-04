import 'package:flutter/foundation.dart';
import 'package:todo_list/modal/Task.dart';
class TaskData extends ChangeNotifier{
  List<Task> tasks=[

  ];
  int get taskCount{
    return tasks.length;
  }
  
  void addTask(String newTask){
    final task=Task(name: newTask, isDone: false);
    tasks.add(task);
    notifyListeners();
  }


  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }
}
