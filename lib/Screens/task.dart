import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/Task.dart';
import '../modal/task_data.dart';
import 'BottomSheet.dart';

class taskScreen extends StatefulWidget {

  @override
  State<taskScreen> createState() => _taskScreenState();
}

class _taskScreenState extends State<taskScreen> {

  TaskData a=new TaskData();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff59c1ff),
              ),
              width: double.infinity,
              padding: const EdgeInsets.only(top: 25, left: 15, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.list, color: Color(0xff59c1ff)),
                    ),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Consumer<TaskData>(
                    builder: (context, taskData, child) {
                      return taskData.tasks.isEmpty
                          ? Text(
                        "No Task",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                          : Text(
                        taskData.tasks.length == 1
                            ? '${taskData.tasks.length} Task'
                            : '${taskData.tasks.length} Tasks',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.only(top: 20.0),
                child: Consumer<TaskData>(
                  builder: (context, taskData, child) {
                    return taskData.tasks.length == 0
                        ? Center(
                      child: Text(
                        'Add new Task',
                        textAlign: TextAlign.center,
                      ),
                    )
                        : TaskList(taskData);
                  },
                ),
              ),

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
            useSafeArea: true,
            context: context,
            isScrollControlled: true,
            builder: (context) => AddTask(),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

}

class TaskList extends StatefulWidget {
  TaskList(this.taskData);
  final TaskData taskData;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.taskData.tasks.length,
        itemBuilder: (context, index){
          final task=widget.taskData.tasks[index];
          return TaskTile(
            isChecked:task.isDone,
            title: task.name,
            toggleCheckBoxState: (checkboxState){
              setState(() {
                task.togglecheck();
              });
            },
            deleteTask:() {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Delete Task'),
                    content: Text('Are you sure you want to delete this ${task.name}?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          widget.taskData.deleteTask(task);
                          Navigator.of(context).pop();
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        });
  }
}

class TaskTile extends StatelessWidget{
  final  bool isChecked;
  final String title;
  final Function toggleCheckBoxState;
  final VoidCallback deleteTask;
  TaskTile({required this.isChecked, required this.title,required this.toggleCheckBoxState,required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Checkbox(
        value: isChecked,
        onChanged: (newValue) => toggleCheckBoxState(newValue!),
      ),
      onLongPress: deleteTask,
      title: Text(title,style: TextStyle(color: isChecked?Colors.green:Colors.black),),
    );
  }
}


