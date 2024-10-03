import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_001/src/bloc/todo_bloc.dart';

class TodoAllListView extends StatelessWidget {
  const TodoAllListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  onChanged: (bool? value) {
                    final todo = state.todos[index].copyWith(
                      isCompleted: value ?? false,
                    );
                    context.read<TodoBloc>().add(ChangeTodoCheckBoxEvent(todo));
                  },
                  value: state.todos[index].isCompleted,
                ),
                title: Text(state.todos[index].title),
              );
            },
            itemCount: state.todos.length,
          );
        },
      ),
    );
  }
}
