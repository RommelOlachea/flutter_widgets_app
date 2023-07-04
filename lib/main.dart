import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 4).getTheme(),
      home: Scaffold(
        body: Center(
          child: FilledButton(onPressed: (){}, child: Text('Hola')),
        ),
      ),
    );
  }
}


//el comando git checkout -- . 
//recupera el proyecto al commit anterior en la rama en la que nos encontramos