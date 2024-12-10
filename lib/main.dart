import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_app_using_provider/feature_todo/presentation/notifier/todo_list_notifier.dart';
import 'package:todo_flutter_app_using_provider/feature_todo/presentation/widgets/add_todo.dart';
import 'package:todo_flutter_app_using_provider/feature_todo/presentation/widgets/todo_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => TodoList(),
          '/add-todo-screen': (_) => AddTodo(),
        },
      ),
    );
  }
}
