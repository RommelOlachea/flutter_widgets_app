import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),

      body: Center(
        child: AnimatedContainer(
          curve: Curves.easeOutCubic,
          duration: const Duration(milliseconds: 400),
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: (){}, 
      child: const Icon(Icons.play_arrow_rounded),
      ),



    );
  }
}
