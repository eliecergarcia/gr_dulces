import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiero_dulces/pages/search_page.dart';
import 'package:quiero_dulces/widgets/constants.dart';

class MenuBottomNavigation extends StatefulWidget {
  @override
  _MenuBottomNavigationState createState() => _MenuBottomNavigationState();
}

class _MenuBottomNavigationState extends State<MenuBottomNavigation> {
  int number = 0;
  void _onTap(int index) {
    setState(() {
      number = index;
      //Navigator.pushNamed(context, SearchPage.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: colorRojo,
      unselectedItemColor: colorBlack,
      currentIndex: number,
      onTap: (int index) {
        _onTap(index);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.search),
          label: 'Buscar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: 'Ubicacion',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.percentage),
          label: 'Promos',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.bell),
          label: 'Pedido',
        ),
      ],
    );
  }
}
