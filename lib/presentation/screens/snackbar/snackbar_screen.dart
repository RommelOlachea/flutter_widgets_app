import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars(); //limpia los snackbars anteriores para que no se esten mostrando encimados
    final snackBar = SnackBar(
      content: Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {},),
      duration: const Duration(seconds: 2), //duracion del snackbar
      );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y dialogos'),
      ),
      body: const Center(
        child: Text('Cuerpo de la pantalla'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        onPressed: () {
          showCustomSnackbar(context);
        },
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
