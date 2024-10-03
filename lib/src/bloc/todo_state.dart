part of 'todo_bloc.dart';

@immutable
sealed class TodoState {
  final List<Todo> todos;
  const TodoState(this.todos);
}

final class TodoInitial extends TodoState {
  const TodoInitial(super.todos);
}

// enum TabType { all, active, completed }
