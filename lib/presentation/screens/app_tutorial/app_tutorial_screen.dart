import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Irure mollit do sunt consequat minim aliquip ad mollit fugiat incididunt quis minim.',
      'assets/images/1.png'),
  SlideInfo(
      'Busca la comida',
      'Exercitation Lorem consectetur elit sunt ut velit.',
      'assets/images/2.png'),
  SlideInfo(
      'Busca la comida',
      'Qui et Lorem irure sunt cillum occaecat occaecat ipsum adipisicing culpa voluptate.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageurl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                  onPressed: () => context.pop(), child: const Text('Salir')))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageurl;

  const _Slide(
      {super.key,
      required this.title,
      required this.caption,
      required this.imageurl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageurl)),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: titleStyle,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
