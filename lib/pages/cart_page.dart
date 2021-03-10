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
  static const double delivery = 20.00;
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
                final String priceFormat = numberFormat00(
                    carItems.products[position].price.toDouble());
                return Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: ListTile(
                              leading: Image.asset('assets/img/logodulces.png'),
                              title:
                                  Text('${carItems.products[position].name}'),
                              subtitle: Text('\$$priceFormat'),
                            ),
                          ),
                          IconButton(
                            icon: Icon(FontAwesomeIcons.trash),
                            onPressed: () {
                              setState(
                                () {
                                  carItems.removeProductSelected(
                                      carItems.products[position]);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                final String deliveryTotal = numberFormat00(delivery);
                final String priceTotal =
                    numberFormat00(carItems.totalPrice.toDouble());
                final double total =
                    double.parse(deliveryTotal) + double.parse(priceTotal);
                final totalOrder = numberFormat00(total);
                return Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      7.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 500,
                          height: 200,
                          //color: Colors.red,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _columnTitles(),
                            _columnPrices(
                                priceTotal, deliveryTotal, totalOrder),
                          ],
                        ),
                        _buttonMakeOrder(),
                      ],
                    ),
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

  Widget _columnTitles() {
    return Column(
      children: [
        Text(
          'Subtotal',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Entrega',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Total',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _columnPrices(
      String priceTotal, String deliveryTotal, String totalOrder) {
    return Column(
      children: [
        Text(
          '\$$priceTotal',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          '\$$deliveryTotal',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          '\$$totalOrder',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buttonMakeOrder() {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.5),
          ),
        ),
        elevation: MaterialStateProperty.resolveWith((states) => 10),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => colorBlack),
      ),
      onPressed: () {},
      child: Text(
        'Realizar Pedido'.toUpperCase(),
        style: TextStyle(
          fontFamily: 'Impact',
          fontSize: 18,
        ),
      ),
    );
  }
}
