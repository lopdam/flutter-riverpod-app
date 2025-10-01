import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/presentation/views/views.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/provider',
      builder: (context, state) => const ProviderView(),
    ),
    GoRoute(
      path: '/provider-router',
      builder: (context, state) => const RouterView(),
    ),
    GoRoute(
      path: '/state-provider',
      builder: (context, state) => const StateProviderView(),
    ),
    GoRoute(
      path: '/todo',
      builder: (context, state) => const TodoView(),
    ),
    GoRoute(
      path: '/future-provider',
      builder: (context, state) => const FutureProviderView(),
    ),
    GoRoute(
      path: '/future-family-provider',
      builder: (context, state) => const FamilyFutureView(),
    ),
    GoRoute(
      path: '/stream-provider',
      builder: (context, state) => const StreamProviderView(),
    ),
  ]);
}
