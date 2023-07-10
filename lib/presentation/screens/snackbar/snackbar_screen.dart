import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context)
        .clearSnackBars(); //limpia los snackbars anteriores para que no se esten mostrando encimados
    final snackBar = SnackBar(
      content: Text('Hola mundo'),
      action: SnackBarAction(
        label: 'Ok!',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2), //duracion del snackbar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: Text('Contenido del cuadro de dialogo'),
        actions: [
          TextButton(onPressed: ()=>context.pop(), child: Text('Cancelar')),
          FilledButton(onPressed: ()=> context.pop(), child: Text('Aceptar')),
        ],

      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text('Texto del cuandro de dialogo'),
                  ]);
                },
                child: Text('licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context), 
                child: const Text('Mostrar dialogo')),
          ],
        ),
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
