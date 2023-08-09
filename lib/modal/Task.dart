import 'package:flutter/material.dart';


class Task{
  final String name;
  bool isDone;
  Task({required this.name,required this.isDone});

  void togglecheck(){
    isDone=!isDone;
  }
}