import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiero_dulces/objects/cart_model.dart';
import 'package:quiero_dulces/widgets/constants.dart';
import 'package:quiero_dulces/widgets/lateral_menu.dart';

import 'cart_page.dart';

class LocationPage extends StatefulWidget {
  static String id = 'location_page';

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    final carItems = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBarNavigation(
        title: "Ubicación",
        colorFont: Colors.white,
        colorBackground: colorRojo,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.cartPlus),
                  onPressed: () {
                    setState(
                      () {
                        Navigator.pushNamed(context, CarPage.id);
                      },
                    );
                  },
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          Navigator.pushNamed(context, CarPage.id);
                        },
                      );
                    },
                    child: Container(
                      child: Text(
                        '${carItems.products.length}',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontFamily: 'Impact',
                        ),
                      ),
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: LateralMenu(),
      body: Center(
        child: Text(
          'Proximamente, \nfunciones en desarrollo',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
