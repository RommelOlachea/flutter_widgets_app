import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double heigth = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 50;
    heigth = random.nextInt(300) + 50;
    borderRadius = random.nextInt(50) + 10;

    setState(() {});
  }

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
          width: width,
          height: heigth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
