import 'package:flutter/material.dart';
import 'package:todo_list_app/views/task_list_view.dart';

import 'models/task_model.dart';
import 'views/add_task_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Todo List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

List<Task> items = [
  Task('Monstre', false),
  Task('Double Monstre', true),
  Task('Triple Monstre', false)
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<StatefulWidget> createState() => _MainState();
}

class _MainState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todo List'),
      ),
      body: const Column(
        children: [
          Expanded(
              flex: 10,
              child: SizedBox(
                height: 800,
                child: TaskListView(),
              )),
        ],
      ),
      floatingActionButton: const AddTaskView(),
    );
  }
}
