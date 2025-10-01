import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/models/todo_model.dart';
import 'package:riverpod_app/providers/segment_provider.dart';
import 'package:riverpod_app/providers/todos_providers.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider + Providers'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref
              .read(todosProvider.notifier)
              .addTodo(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}

class _TodoView extends ConsumerWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SegmentType segment = ref.watch(segmentProvider);

    late final List<Todo> todos;

    if (segment == SegmentType.all) {
      todos = ref.watch(todosProvider);
    } else if (segment == SegmentType.done) {
      todos = ref.watch(doneTasksProvider);
    } else {
      todos = ref.watch(pendingTasksProvider);
    }

    return Column(
      children: [
        const ListTile(
          title: Text('Todo List'),
          subtitle: Text('Manage your tasks and mark them as completed'),
        ),
        SegmentedButton(
          showSelectedIcon: false,
          segments: const [
            ButtonSegment(value: SegmentType.all, icon: Text('All')),
            ButtonSegment(value: SegmentType.done, icon: Text('Completed')),
            ButtonSegment(value: SegmentType.pending, icon: Text('Pending')),
          ],
          selected: <SegmentType>{segment},
          onSelectionChanged: (value) {
            ref.read(segmentProvider.notifier).changeSegment(value.first);
          },
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return SwitchListTile(
                  title: Text(todos[index].description),
                  value: todos[index].isCompleted,
                  onChanged: (value) {
                    ref
                        .read(todosProvider.notifier)
                        .updateTodo(todos[index], value);
                  });
            },
          ),
        )
      ],
    );
  }
}
