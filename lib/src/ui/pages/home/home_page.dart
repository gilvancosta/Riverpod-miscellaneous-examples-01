// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

// ConsumerWidget substitui StatelessWidget para adicionar o parâmetro ref
// no método de construção
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('BUILDING HOME PAGE');
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (contexto, refLocal, _) {
              // obtém o valor atual do counterProvider
              // irá recarregar o widget se o valor mudar
              final count = refLocal.watch(counterProvider);
              return Text('$count', style: const TextStyle(fontSize: 48.0));
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
// altera o estado do counterProvider por
// acessando o StateNotifier diretamente.
// Riverpod notificará automaticamente os ouvintes.
        onPressed: () => ref.read(counterProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
