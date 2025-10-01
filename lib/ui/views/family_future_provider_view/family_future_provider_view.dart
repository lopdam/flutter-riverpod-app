import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/providers/futures_providers.dart';

class FamilyFutureScreen extends ConsumerStatefulWidget {
  const FamilyFutureScreen({super.key});

  @override
  ConsumerState createState() => _FamilyFutureScreenState();
}

class _FamilyFutureScreenState extends ConsumerState<FamilyFutureScreen> {
  int id = 1;

  @override
  Widget build(BuildContext context) {
    final pokemon = ref.watch(pokemonProvider(id: id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Future Provider'),
      ),
      body: Center(
        child: pokemon.when(
          data: (data) => Text(data, style: const TextStyle(fontSize: 25)),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                id++;
              });
            },
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            child: const Icon(Icons.exposure_minus_1_rounded),
            onPressed: () {
              if (id == 1) return;
              setState(() {
                id--;
              });
            },
          ),
        ],
      ),
    );
    ;
  }
}
