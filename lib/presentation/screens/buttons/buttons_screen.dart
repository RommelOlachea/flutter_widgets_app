import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop(); //propio de go router
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
                icon: const Icon(Icons.access_alarm_rounded),
                onPressed: () {},
                label: const Text('Elevated icon')),

            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.abc_outlined),
              label: const Text('Filled icon'),
            ),

            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(
              onPressed: () {},
              label: const Text('Outline'),
              icon: Icon(Icons.terminal),
            ),

            TextButton(onPressed: () {}, child: const Text('TextButton')),
            TextButton.icon(
              onPressed: () {},
              label: const Text('Text Icon'),
              icon: const Icon(Icons.account_box_outlined),
            ),

            //todo: custom button

            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded)),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),
            const CustomButton()
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            
          },        
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}

//el widget de maternial con el que esta envuelto el padding, nos permite ponerle unas propiedades propias del material
//el widget InkWell es como un gesture detector, puede detectar un tap, pero ademas pone la animacion de splash del 
//boton cuando hacemos el tap como si un boton predeterminado se tratara



//wrap funciona similar al row y al column, solo que pone los controles uno al lado
//del otro y cuando no hay espacio los pone debajo.