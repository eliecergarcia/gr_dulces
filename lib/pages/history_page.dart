import 'package:flutter/material.dart';
import 'package:quiero_dulces/widgets/constants.dart';
import 'package:quiero_dulces/widgets/lateral_menu.dart';

class HistoryPage extends StatelessWidget {
  static String id = 'history_page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarNavigation(
          title: 'Mis Pedidos',
          colorFont: Colors.white,
          actions: [],
        ),
        drawer: LateralMenu(),
      ),
    );
  }
}
