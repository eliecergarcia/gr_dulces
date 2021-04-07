
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiero_dulces/objects/cart_model.dart';
import 'package:quiero_dulces/objects/product.dart';
import 'package:quiero_dulces/widgets/alert_dialog.dart';
import 'package:quiero_dulces/widgets/bottom_navigation.dart';
import 'package:quiero_dulces/widgets/constants.dart';

class CarPage extends StatefulWidget {
  static String id = "cart_page";

  @override
  _CarPageState createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  final productReference = FirebaseDatabase.instance.reference().child('order');
  String street;
  String colony;
  int totalFirebase = 0;
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
        body: _itemsCardOrder(context),
      ),
    );
  }

  Widget _itemsCardOrder(BuildContext context) {
    final carItems = Provider.of<CartModel>(context);
    final String deliveryTotal = numberFormat00(delivery);
    final String priceTotal = numberFormat00(carItems.totalPrice.toDouble());
    final double total = double.parse(deliveryTotal) + double.parse(priceTotal);
    final totalOrder = numberFormat00(total);
    totalFirebase = total.toInt();
    return (carItems.products.length != 0)
        ? ListView.builder(
            physics: BouncingScrollPhysics(),
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
                return Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5.0,
                      child: ListTile(
                        title: Text(
                          'Metodo de Pago',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.moneyBill,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              _onlyMoney();
                            });
                          },
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          7.5,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              'Datos de la entrega'.toUpperCase(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Domicilio',
                                  hintText: 'Isla raza 3030',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onChanged: (value) {
                                  street = value;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 10.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Colonia',
                                  hintText: 'Jardines de la cruz',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                onChanged: (value) {
                                  colony = value;
                                },
                              ),
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
                    ),
                  ],
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
    final carItems = Provider.of<CartModel>(context);
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevation: MaterialStateProperty.resolveWith((states) => 10),
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => colorBlack),
      ),
      onPressed: () {
        setState(() {
          String items =" ";
          for(int i=0; i<carItems.products.length;i++){
            items =  items +(",") + carItems.products[i].name;
          }
          if (street == null || colony == null) {
            _emptyFields();
          } else {
            try {
              productReference.push().set({
                'client-name': 'absalon garcia',
                'product-order': items,
                'total': totalFirebase,
                'street': street,
                'cologne': colony,
                'phone-number': 3333333,
              }).then(
                (_) {
                  carItems.removeAll();
                  Navigator.pushNamed(context, MenuBottomNavigation.id);
                }
              );
            } catch (e) {
              print("error");
            }
          }
        });
      },
      child: Text(
        'Realizar Pedido'.toUpperCase(),
        style: TextStyle(
          fontFamily: 'Impact',
          fontSize: 18,
        ),
      ),
    );
  }

  void _emptyFields() {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertContent(
            'Rellene todos los campos',
            "No se permiten campos vacios",
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoDialogText(
            context: context,
            contentTitle: 'Rellene todos los campos',
            textTitle: 'No se permiten campos vacios',
          );
        },
      );
    }
  }

  void _onlyMoney() {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertContent(
            'Solo se aceptan pagos con Efectivo',
            'Disculpe las molestias',
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoDialogText(
            context: context,
            contentTitle: 'Disculpe las molestias',
            textTitle: 'Solo se aceptan pagos con Efectivo',
          );
        },
      );
    }
  }
}
