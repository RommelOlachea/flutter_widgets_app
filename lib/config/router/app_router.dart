

// GoRouter configuration
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/counter/counter_screen.dart';
import 'package:widgets_app/presentation/theme_changer/theme_changer_screen.dart';
import '../../presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [    
    GoRoute(
      name: HomeScreen.name,      
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(      
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(      
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(      
      name: ProgressScreen.name,
      path: '/progress',
      builder: (context, state) => ProgressScreen(),
    ),
    GoRoute(      
      name: SnackbarScreen.name,
      path: '/snackbars',
      builder: (context, state) => SnackbarScreen(),
    ),
    GoRoute(      
      name: AnimatedScreen.name,
      path: '/animated',
      builder: (context, state) => AnimatedScreen(),
    ),
    GoRoute(      
      name: UiControlScreen.name,
      path: '/ui-controls',
      builder: (context, state) => UiControlScreen(),
    ),
    GoRoute(      
      name: AppTutorialScreen.name,
      path: '/tutorial',
      builder: (context, state) => AppTutorialScreen(),
    ),
    GoRoute(      
      name: InfiniteScrollScreen.name,
      path: '/infinite',
      builder: (context, state) => InfiniteScrollScreen(),
    ),
    GoRoute(      
      name: CounterScreen.name,
      path: '/counter',
      builder: (context, state) => CounterScreen(),
    ),
    GoRoute(      
      name: ThemeChangerScreen.name,
      path: '/theme-changer',
      builder: (context, state) => ThemeChangerScreen(),
    ),
  ],
);

//GoRoute, el parametro name, solamente sirve para identicar el path, teoricamente,
//si ya tenemos el path, no ocupamos el name, pero como dice fernando, queda a nuestrea
//discrecion