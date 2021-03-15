import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuBottomNavigation extends StatelessWidget {
  const MenuBottomNavigation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home),
          label: 'Inicio',
        ),
      ],
    );
  }
}
