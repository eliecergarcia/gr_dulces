import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiero_dulces/pages/categories_page.dart';

import 'constants.dart';

class LateralMenu extends StatelessWidget {
  const LateralMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colorRojo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Flexible(
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
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.candyCane,
              color: Colors.redAccent,
            ),
            title: Text(
              'Categorias',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, CategoriesPage.id),
          ),
        ],
      ),
    );
  }
}