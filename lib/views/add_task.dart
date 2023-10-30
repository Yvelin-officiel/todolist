import 'package:flutter/material.dart';
import 'package:todo_list_app/main.dart';
import 'package:todo_list_app/models/task_model.dart';

class AddTask extends StatelessWidget {
  AddTask({super.key});

  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Center(
                child: SizedBox(
                  width: 500,
                  child: TextField(
                    autofocus: true,
                    controller: _textFieldController,
                    decoration:
                        const InputDecoration(hintText: 'Ajouter une tâche'),
                  ),
                ),
              )),
          SizedBox(
            height: 70,
            child: ElevatedButton(
              onPressed: () {
                if (_textFieldController.text.isNotEmpty) {
                  addTask(_textFieldController.text);
                  // Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('La tâche doit contenir un text !'),
                    duration: Duration(seconds: 1),
                  ));
                }
              },
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }

  void addTask(String title) {
    Task task = Task(title, false);
    items.add(task);
  }
}
