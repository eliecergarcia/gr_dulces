import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiero_dulces/objects/cart_model.dart';
import 'package:quiero_dulces/widgets/constants.dart';
import 'package:quiero_dulces/widgets/lateral_menu.dart';

import 'cart_page.dart';

class OrderPage extends StatefulWidget {
  static String id = 'order_page';

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    final carItems = Provider.of<CartModel>(context);
    return Scaffold(
      appBar: AppBarNavigation(
        title: "Pedidos",
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
        child: Text('No has realizado ningun \n pedido hasta el momento'),
      ),
    );
  }
}
