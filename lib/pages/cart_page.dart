import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiero_dulces/objects/cart_model.dart';
import 'package:quiero_dulces/widgets/constants.dart';
import 'package:quiero_dulces/widgets/lateral_menu.dart';

class CarPage extends StatefulWidget {
  static String id = "cart_page";

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final carItems = Provider.of<CartModel>(context, listen: false).products;
    return SafeArea(
      child: Scaffold(
        appBar: AppBarNavigation(
          title: "Orden",
          colorFont: Colors.white,
        ),
        drawer: LateralMenu(),
        body: _itemsCardOrder(context),
      ),
    );
  }

  Widget _itemsCardOrder(BuildContext context) {
    final carItems = Provider.of<CartModel>(context);
    return (carItems.products.length != 0)
        ? ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            itemCount: carItems.products.length + 1,
            itemBuilder: (BuildContext context, int position) {
              if (position < carItems.products.length) {
                return Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: ListTile(
                          leading: Image.asset('assets/img/logodulces.png'),
                          title: Text('${carItems.products[position].name}'),
                          subtitle:
                              Text('\$${carItems.products[position].price}'),
                        ),
                      ),
                      IconButton(
                          icon: Icon(FontAwesomeIcons.trash),
                          onPressed: () {
                            setState(() {
                              carItems.removeProductSelected(
                                  carItems.products[position]);
                            });
                          }),
                    ],
                  ),
                );
              } else {
                return Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      7.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Total: "),
                          Text("\$${carItems.totalPrice}"),
                        ],
                      ),
                      _emptyCart(),
                    ],
                  ),
                );
              }
            },
          )
        : _textNoItems();
  }

  Widget _textNoItems() {
    return Center(
      child: Text(
        'No tienes Productos\n en tu carrito'.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _emptyCart() {
    final carItems = Provider.of<CartModel>(context);
    return ElevatedButton(
      onPressed: () {
        setState(() {
          carItems.removeAll();
        });
      },
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith<Color>((states) => colorRojo),
      ),
      child: Text(
        "Vaciar Carrito",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    );
  }
}
