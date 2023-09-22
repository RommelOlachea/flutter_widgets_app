import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(countProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(isDarkModeProvider.notifier)
                    .update((isDarkModeState) => !isDarkModeState);
              },
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Valor: $clickCounter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ref.read(countProvider.notifier).state++; //primera manera de hacerlo
          //nota, con notifier, se redibijara solo la parte del widget involucrada
          ref
              .read(countProvider.notifier)
              .update((state) => state + 1); //segunda forma de hacerlo
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
