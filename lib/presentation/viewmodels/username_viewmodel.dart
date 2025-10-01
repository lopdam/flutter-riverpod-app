import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'username_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class UserName extends _$UserName {
  @override
  String build() {
    return 'Dennys Lopez';
  }

  void changeUserName(String newName) {
    state = newName;
  }
}
