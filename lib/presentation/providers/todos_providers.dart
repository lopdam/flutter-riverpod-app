import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/domain/entities/todo.dart';
import 'package:uuid/uuid.dart';

part 'todos_providers.g.dart';

const Uuid uuid = Uuid();

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName()),
      Todo(id: uuid.v4(), description: RandomGenerator.getRandomName()),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          isCompleted: true),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          isCompleted: false),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          isCompleted: true),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          isCompleted: false)
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
List<Todo> invitedTodos(Ref ref) {
  final List<Todo> todos =
      ref.watch(todosProvider).where((element) => element.isCompleted).toList();
  return todos;
}

@riverpod
List<Todo> notInvitedTodos(Ref ref) {
  final List<Todo> todos = ref
      .watch(todosProvider)
      .where((element) => !element.isCompleted)
      .toList();
  return todos;
}
