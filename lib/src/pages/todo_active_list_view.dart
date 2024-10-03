import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_001/src/bloc/todo_bloc.dart';

class TodoActiveListView extends StatelessWidget {
  const TodoActiveListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemBuilder: (context, index) {
              if (!state.todos[index].isCompleted) {
                return ListTile(
                  leading: Checkbox(
                    onChanged: (value) {
                      final todo = state.todos[index].copyWith(
                        isCompleted: value ?? false,
                      );
                      context
                          .read<TodoBloc>()
                          .add(ChangeTodoCheckBoxEvent(todo));
                    },
                    value: state.todos[index].isCompleted,
                  ),
                  title: Text(state.todos[index].title),
                );
              } else {
                return const Center(child: Text('No Active todo...'));
              }
            },
            itemCount: state.todos.length,
          );
        },
      ),
    );
  }
}
