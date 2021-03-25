import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiero_dulces/pages/categories_page.dart';
import 'package:quiero_dulces/pages/discount_page.dart';
import 'package:quiero_dulces/pages/location_page.dart';
import 'package:quiero_dulces/pages/order_page.dart';
import 'package:quiero_dulces/pages/search_page.dart';
import 'package:quiero_dulces/widgets/constants.dart';

class MenuBottomNavigation extends StatefulWidget {
  static String id = 'bottom_navigation';
  @override
  _MenuBottomNavigationState createState() => _MenuBottomNavigationState();
}

class _MenuBottomNavigationState extends State<MenuBottomNavigation> {
  int number = 0;

  final _pageOptions = [
    CategoriesPage(),
    SearchPage(),
    LocationPage(),
    DiscountPage(),
    OrderPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[number],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colorRojo,
        unselectedItemColor: colorBlack,
        currentIndex: number,
        onTap: (index) {
          setState(() {
            number = index;
          });
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
      ),
    );
  }
}
