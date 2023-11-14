// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/home_controller.dart';

//final counterProvider = StateProvider<int>((ref) => 0);
//final contador = StateProvider((ref) => 0);
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.watch(counterProvider);

    print('BUILDING HOME PAGE 2');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador Riverpod'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Número atual:',
              style: TextStyle(fontSize: 20),
            ),
            Consumer(
              builder: (context, watch, _) {
                return Text(
                  '${homeController.counter}', // watch(contador).value.toString(),
                  style: const TextStyle(fontSize: 40),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    homeController.increment();
                  },
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    homeController.decrement();
                  },
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
