import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiero_dulces/pages/categories_page.dart';
import 'package:quiero_dulces/pages/google_maps_page.dart';
import 'package:quiero_dulces/pages/history_page.dart';
import 'package:quiero_dulces/pages/payment_method_page.dart';

import 'constants.dart';

class LateralMenu extends StatefulWidget {
  const LateralMenu({
    Key key,
  }) : super(key: key);

  @override
  _LateralMenuState createState() => _LateralMenuState();
}

class _LateralMenuState extends State<LateralMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            duration: Duration(
              milliseconds: 50,
            ),
            decoration: BoxDecoration(
              color: colorRojo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Quiero \nDulces'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 40.0,
                      //fontWeight: FontWeight.w600,
                      fontFamily: 'Impact',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          ListTileMenu(
            icon: FontAwesomeIcons.candyCane,
            text: 'Categorias',
            function: () => Navigator.pushNamed(
              context,
              CategoriesPage.id,
            ),
          ),
          ListTileMenu(
            icon: FontAwesomeIcons.wallet,
            text: 'Método de Pago',
            function: () => Navigator.pushNamed(
              context,
              PaymentMethodPage.id,
            ),
          ),
          ListTileMenu(
            icon: FontAwesomeIcons.receipt,
            text: "Mis Pedidos",
            function: () => Navigator.pushNamed(
              context,
              HistoryPage.id,
            ),
          ),
          ListTileMenu(
            icon: FontAwesomeIcons.percentage,
            text: "Cupones",
            function: () => Navigator.pushNamed(context, MapSample.id),
          ),
        ],
      ),
    );
  }
}
