import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  bool build() {
    return true;
  }

  void toggleTheme() {
    state = !state;
  }
}
