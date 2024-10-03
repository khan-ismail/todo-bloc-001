import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_001/src/bloc/todo_bloc.dart';
import 'package:todo_001/src/models/todo.dart';
import 'package:uuid/uuid.dart';

class AddNewTodoView extends StatefulWidget {
  const AddNewTodoView({super.key});

  @override
  State<AddNewTodoView> createState() => _AddNewTodoViewState();
}

class _AddNewTodoViewState extends State<AddNewTodoView> {
  final todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Todo')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: todoController,
                decoration: const InputDecoration(hintText: 'Add new todo'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final todo = Todo(
                    uuid: const Uuid().v4(),
                    title: todoController.text.trim(),
                    description: 'description',
                    createdAt: DateTime.now(),
                  );
                  context.read<TodoBloc>().add(AddNewTodoEvent(todo));
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add Todo',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
