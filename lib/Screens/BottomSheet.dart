import 'package:flutter/material.dart';


class AddTask extends StatelessWidget {

  final List<Widget> tasks=[];
  late String text;
  bool isChecked=false;
  late Function toggleCheckBoxState;
  final Function callback;

  AddTask( this.callback);

  @override
  Widget build(BuildContext context) {

      return Container(
        color: Color(0xff757575),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),
                  topLeft: Radius.circular(20))
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text('Add Task',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 23),)),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: InputDecoration(
                ),
                onChanged: (value){
                    text=value;
                },
              ),
              SizedBox(height: 15,),
              Center(
                child: Container(
                  width: double.infinity,
                  color: Colors.lightBlueAccent,
                  child: TextButton(

                    onPressed: () {
                      callback(text);
                      Navigator.pop(context);
                    }, child: Text('Add',textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontSize: 14),
                  ),
                  ),
                ),
              )
            ],
          ),
        ),

      );
    }
  }

