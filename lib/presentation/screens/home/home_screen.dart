import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey, //el key hace referencia al estado actual del scaffold, es decir, si tiene drawer, menu lateral etc 
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey,),
    );
  }
}

//drawer es para el menu lateral de izquierda a derecha, y el enddrawer para derecha
//a izquierda

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuItems = appMenuItems;

    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final menuItem = menuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) => const ButtonsScreen(),
        //     ),
        //   );
        // Navigator.pushNamed(context, menuItem.link);

        context.push(menuItem.link); //esto ya es con go_router
        // context.pushNamed(CardsScreen.name); //esto es con go router
      },
    );
  }
}
