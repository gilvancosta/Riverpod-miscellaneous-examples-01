// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() => state++;
  void decrement() => state++;
}

final counterNotifierProvider =
    StateNotifierProvider<CounterNotifier, int>((ref) => CounterNotifier());

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('BUILDING HOME PAGE');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter value: '),
            Consumer(
              builder: (contexto, refLocal, _) {
                final counter = refLocal.watch(counterNotifierProvider);
                return Text('$counter');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed:
                      ref.read(counterNotifierProvider.notifier).increment,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed:
                      ref.read(counterNotifierProvider.notifier).decrement,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
