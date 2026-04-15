import 'todo.dart';
import 'dart:io';
import 'package:todo_app/todo_repository.dart';
import 'package:todo_app/todo.dart';

class TodoRepository {
  final List<Todo> _todos = [];
  List<Todo> getAll() {
    return _todos;
  }

  void add(String title) {
    if (title.trim().isEmpty) {
      throw ArgumentError("Nazvanie zadachi ne mozhet bit pustim");
    }
    Todo todo = Todo(title.trim());
    _todos.add(todo);
  }

  void complete(int id) {
    for (var todo in _todos) {
      if (todo.id == id) {
        todo.isDone = true;
        return;
      }
    }
    throw ArgumentError("Zadacha s id $id ne naydina");
  }

  void delete(int id) {
    for (int i = 0; i < _todos.length; i++) {
      if (_todos[i].id == id) {
        _todos.removeAt(i);
        return;
      }
    }
    throw ArgumentError("Zadacha s id $id ne naydina");
  }
}
