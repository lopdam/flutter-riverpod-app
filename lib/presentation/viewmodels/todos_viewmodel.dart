import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/domain/models/todo_model.dart';
import 'package:uuid/uuid.dart';

part 'todos_viewmodel.g.dart';

const Uuid uuid = Uuid();

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [
      Todo(id: uuid.v4(), description: "Buy groceries", isCompleted: false),
      Todo(
          id: uuid.v4(), description: "Write documentation", isCompleted: true),
      Todo(
          id: uuid.v4(),
          description: "Review pull requests",
          isCompleted: false),
      Todo(id: uuid.v4(), description: "Call client", isCompleted: true),
      Todo(id: uuid.v4(), description: "Fix bug #123", isCompleted: false),
      Todo(
          id: uuid.v4(), description: "Update dependencies", isCompleted: false)
    ];
  }

  void addTodo(String description) {
    final Todo newTodo = Todo(id: uuid.v4(), description: description);
    state = [...state, newTodo];
  }

  void updateTodo(Todo todo, bool isCompleted) {
    state = [
      for (final t in state)
        if (t.id == todo.id) todo.copyWith(isCompleted: isCompleted) else t
    ];
  }
}

@riverpod
List<Todo> doneTasks(Ref ref) {
  final List<Todo> todos =
      ref.watch(todosProvider).where((element) => element.isCompleted).toList();
  return todos;
}

@riverpod
List<Todo> pendingTasks(Ref ref) {
  final List<Todo> todos = ref
      .watch(todosProvider)
      .where((element) => !element.isCompleted)
      .toList();
  return todos;
}
