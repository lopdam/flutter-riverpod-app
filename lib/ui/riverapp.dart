import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/config/config.dart';
import 'package:riverpod_app/providers/theme_provider.dart';

class RiverApp extends ConsumerWidget {
  const RiverApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final bool theme = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'RiverApp',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: theme).getTheme(),
    );
  }
}
