import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/providers/futures_providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonName = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonName.when(
          data: (data) => Text(data, style: const TextStyle(fontSize: 25)),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          ref.invalidate(pokemonNameProvider);
        },
      ),
    );
  }
}
