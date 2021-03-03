import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiero_dulces/objects/cart_model.dart';

class CarPage extends StatelessWidget {
  static String id = "cart_page";
  @override
  Widget build(BuildContext context) {
    final carItems = Provider.of<CartModel>(context, listen: false).products;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Orden',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          //backgroundColor: Colors.white,
        ),
        body: Center(
          child: (carItems.length > 0) ? Text("Funciona") : Text("No funciona"),
        ),
      ),
    );
  }
}
