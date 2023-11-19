import 'package:riverpod_annotation/riverpod_annotation.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'home_controller.g.dart';


@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increaseByOne() {
    state++;
  }

  void decreaseByOne() {
    state--;
  }
}
