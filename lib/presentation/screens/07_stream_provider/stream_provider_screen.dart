import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/presentation/providers/stream_provider.dart';

class StreamProviderScreen extends StatelessWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: const StreamView(),
    );
  }
}

class StreamView extends ConsumerWidget {
  const StreamView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersProvider);

    if (users.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (users.hasError) {
      return Center(child: Text('Error: ${users.error}'));
    }

    final usersData = users.value!;

    return ListView.builder(
      itemCount: usersData.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(usersData[index]),
      ),
    );
  }
}
