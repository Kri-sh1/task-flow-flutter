//Dashboard page

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget
{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage>
{
  List<String> tasks = [];
  TextEditingController taskController = TextEditingController();

  void deleteTask(int index)
  {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void addTask()
  {
    if(taskController.text.isNotEmpty)
    {
      setState(() {
        tasks.add(taskController.text);
        taskController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(child: Text("Home Page")),
    );
  }
}