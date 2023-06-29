import 'package:flutter/material.dart';

import '../modal/Task.dart';
import 'BottomSheet.dart';

class taskScreen extends StatefulWidget {

  @override
  State<taskScreen> createState() => _taskScreenState();
}

class _taskScreenState extends State<taskScreen> {

  List<Task> tasks=[
  ];

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
                //borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(10))
              ),
              width: double.infinity,
              padding: const EdgeInsets.only(top: 25,left: 15,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(onPressed: (){

                    }, icon: Icon(Icons.list,color: Color(0xff59c1ff),),),
                  ),
                  SizedBox(height: 10,),
                  Text('Todoey',style: TextStyle(fontSize: 40,color: Colors.white,fontWeight: FontWeight.w700),),
                  Text('${tasks.length}',style: TextStyle(color: Colors.white,fontSize: 18),)
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
                          topRight: Radius.circular(20))
                  ),
                  padding: const EdgeInsets.only(top: 20.0),
                  child:tasks.length==0?Center(child: Text('No task available here'
                      '\n Add new Task',textAlign: TextAlign.center,),):
                  TaskList(tasks),
                ))
          ],
        ),
      ),
      floatingActionButton:
      FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                  child:Container(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTask((newTask){
                      print(newTask);
                      setState(() {
                        tasks.add(Task(name: newTask, isDone: false),);
                      });


                    } ),
                  )
              )
          );
        },
        child: Icon(Icons.add,color: Colors.white,),),
    );
  }
}

class TaskList extends StatefulWidget {
  TaskList(this.tasks);
  List<Task> tasks;


  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index){
        return TaskTile(isChecked: widget.tasks[index].isDone,
            title: widget.tasks[index].name,
          toggleCheckBoxState: (checkboxState){
               setState(() {
                 widget.tasks[index].togglecheck();
               });
          },
        );
      });
  }
}

class TaskTile extends StatelessWidget{
  final  bool isChecked;
  final String title;
  final Function toggleCheckBoxState;

  TaskTile({required this.isChecked, required this.title,required this.toggleCheckBoxState});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Checkbox(
        value: isChecked,
        onChanged: (newValue) => toggleCheckBoxState(newValue!),
      ),
      title: Text(title,style: TextStyle(decoration: isChecked?TextDecoration.lineThrough:null),),
    );
  }
}



