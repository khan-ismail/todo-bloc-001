import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_001/src/models/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoInitial([])) {
    on<AddNewTodoEvent>((event, emit) {
      if (event.todo.title.isEmpty) return;
      emit(TodoInitial([...state.todos, event.todo]));
    });

    on<ChangeTodoCheckBoxEvent>((event, emit) {
      for (var i = 0; i < state.todos.length; i++) {
        if (state.todos[i].uuid == event.todo.uuid) {
          state.todos[i] = event.todo;
        }
      }

      emit(TodoInitial([...state.todos]));
    });
  }
}
