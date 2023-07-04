import 'package:flutter/material.dart';
import 'Screens/task.dart';
import 'package:provider/provider.dart';
import 'modal/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: taskScreen(),
      ),
    );
  }
}


