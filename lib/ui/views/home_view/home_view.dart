import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverApp'),
      ),
      body: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(
            title: 'Simple Provider',
            subTitle: 'A read-only provider',
            location: '/provider'),
        _CustomListTile(
            title: 'Provider + Go_Router',
            subTitle: 'A practical use case',
            location: '/provider-router'),
        _CustomListTile(
            title: 'State Provider',
            subTitle: 'A state to store an object',
            location: '/state-provider'),
        _CustomListTile(
            title: 'State Provider + Provider',
            subTitle: 'TODO - A mix between providers',
            location: '/todo'),
        _CustomListTile(
            title: 'Future Provider',
            subTitle: 'Maintain the state of a future and its return',
            location: '/future-provider'),
        _CustomListTile(
            title: 'Family Future Provider',
            subTitle: 'Providers with arguments',
            location: '/future-family-provider'),
        _CustomListTile(
            title: 'Stream Provider',
            subTitle: 'Maintain the state of a Stream and its emissions',
            location: '/stream-provider'),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTile({
    required this.title,
    required this.subTitle,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}
