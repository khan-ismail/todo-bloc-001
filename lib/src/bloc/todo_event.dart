part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class AllTodoListEvent extends TodoEvent {}

final class ActiveTodoListEvent extends TodoEvent {}

final class CompletedTodoEvent extends TodoEvent {}

final class AddNewTodoEvent extends TodoEvent {
  final Todo todo;
  AddNewTodoEvent(this.todo);
}

final class ChangeTodoCheckBoxEvent extends TodoEvent {
  final Todo todo;
  ChangeTodoCheckBoxEvent(this.todo);
}
