import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_app_using_provider/feature_todo/models/task_model.dart';
import 'package:todo_flutter_app_using_provider/feature_todo/presentation/notifier/todo_list_notifier.dart';


class AddTodo extends StatelessWidget {
  final controller = TextEditingController();

  AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Center(
          child: Text('Add Todo'),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'Title',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () => _addTask(context),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _addTask(BuildContext context) {
    final taskText = controller.text;
    if (taskText.isNotEmpty) {
      Provider.of<TaskProvider>(context, listen: false).addTask(Task(
        id: DateTime.now().toString(),
        title: taskText,
        isDone: false,
      ));
      controller.clear();
      Navigator.of(context).pop();
    }
  }
}
