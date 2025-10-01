import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() {
    return 5;
  }

  void increment() {
    state++;
  }
}
