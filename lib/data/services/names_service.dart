import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/config/config.dart';

part 'names_service.g.dart';

@Riverpod(keepAlive: true)
Stream<List<String>> users(Ref ref) async* {
  final List<String> userNames = [];
  await for (final name in RandomGenerator.randomNameStream()) {
    userNames.add(name);
    yield userNames;
  }
}
