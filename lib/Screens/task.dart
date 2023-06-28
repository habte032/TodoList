import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class taskScreen extends StatelessWidget {

   bool ischeked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
                child:
               Container(
                 decoration: BoxDecoration(
                     color: Color(0xff59c1ff),
                   //borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(10))
                 ),
                 width: double.infinity,
              padding: const EdgeInsets.only(top: 25,left: 15),
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
                  Text('12 Tasks',style: TextStyle(color: Colors.white,fontSize: 18),)
                ],

              ),
            )),
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
              padding: const EdgeInsets.all(8.0),
              child: ListView(

                children: [
                 ListTile(
                   title: Text('new task',style: TextStyle(),),
                 )
                ],

              ),
            ))
          ],
        ),
      ),
      floatingActionButton:
      FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
          onPressed: (){
      },
      child: Icon(Icons.add,color: Colors.white,),),
    );
  }
}

