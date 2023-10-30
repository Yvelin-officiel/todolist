import 'package:flutter/material.dart';

import '../main.dart';
import '../models/task_model.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Recharger')),
        ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  side: const BorderSide(width: 2),
                  value: items[index].completed,
                  onChanged: (bool? value) {
                    setState(() {
                      items[index].completed = value!;
                    });
                  },
                ),
                title: Text(items[index].title),
                trailing: ElevatedButton(
                  onPressed: () {
                    deleteTask(items[index]);
                    setState(() {});
                  },
                  child: const Icon(Icons.delete),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
            itemCount: items.length)
      ],
    );
  }
}

void deleteTask(Task task) {
  items.remove(task);
}
