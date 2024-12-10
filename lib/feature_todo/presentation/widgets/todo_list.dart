import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_app_using_provider/feature_todo/presentation/notifier/todo_list_notifier.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context);
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Center(
          child: Text('To-Do List'),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: tasks.tasks.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 0,
            ),
            child: Slidable(
              endActionPane:
              ActionPane(motion: const StretchMotion(), children: [
                SlidableAction(
                  onPressed: (_) {
                    tasks.removeTask(
                      tasks.tasks[index],
                    );
                  },
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(15),
                ),
              ]),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Text(
                    tasks.tasks[index].title,
                    style: TextStyle(
                      decoration: tasks.tasks[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: Colors.white,
                      decorationThickness: 2,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  leading: Checkbox(
                    value: tasks.tasks[index].isDone,
                    onChanged: (_) {
                      tasks.checkTask(index);
                    },
                    checkColor: Colors.black,
                    activeColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-todo-screen');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
