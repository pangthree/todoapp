import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Todo {
  Todo({required this.id, required this.description, this.completed = false});

  String id;
  String description;
  bool completed;
}

class TodoList extends StateNotifier<List<Todo>> {
  TodoList(List<Todo> data) : super(data);

  void addTodo(String desc) {
    state = [...state, Todo(id: _uuid.v4(), description: desc)];
  }

  void editTodo(String id, String desc) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(id: todo.id, description: desc, completed: todo.completed)
        else
          todo,
    ];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            id: todo.id,
            description: todo.description,
            completed: !todo.completed,
          )
        else
          todo,
    ];
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
