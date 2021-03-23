import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiero_dulces/objects/cart_model.dart';
import 'package:quiero_dulces/objects/product.dart';
import 'package:quiero_dulces/widgets/constants.dart';
import 'package:quiero_dulces/widgets/lateral_menu.dart';

import 'cart_page.dart';
import 'category_selected.dart';

class AllProductsPage extends StatefulWidget {
  static String id = 'all_products';

  @override
  _AllProductsPageState createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
  List<Product> items;
  StreamSubscription<Event> _onProductAddedSubscription;
  StreamSubscription<Event> _onProductChangeSubscription;

  @override
  void initState() {
    items = [];
    _onProductAddedSubscription =
        productReference.onChildAdded.listen(_onProductAdded);
    _onProductChangeSubscription =
        productReference.onChildAdded.listen(_onProductUpdate);
    super.initState();
  }

  @override
  void dispose() {
    _onProductAddedSubscription.cancel();
    _onProductChangeSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final carItems = Provider.of<CartModel>(context);
    return SafeArea(
      bottom: true,
      child: Scaffold(
        drawer: LateralMenu(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: colorRojo,
              title: Text(
                'productos'.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
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
                    ],
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) {
                  return _cardProduct(i);
                },
                childCount: items.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onProductAdded(Event event) {
    setState(() {
      items.add(new Product.fromSnapShot(event.snapshot));
    });
  }

  void _onProductUpdate(Event event) {
    var oldProductValue =
        items.singleWhere((product) => product.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldProductValue)] =
          new Product.fromSnapShot(event.snapshot);
    });
  }

  Widget _cardProduct(int position) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: ListTile(
                    title: Text(
                      '${items[position].name}',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    subtitle: Text(
                      '${items[position].description}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                containerImgItem(),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            elevatedButtonAddCarItem(position),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [],
            ),
          ],
        ),
      ),
    );
  }

  Widget containerImgItem() {
    return Container(
      margin: EdgeInsets.only(top: 5.0, right: 5.0),
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: colorRojo,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage("assets/img/logodulces.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget elevatedButtonAddCarItem(int position) {
    final carItems = Provider.of<CartModel>(context);
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith((states) => 10),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => Colors.redAccent),
      ),
      onPressed: () {
        print("agregado");
        setState(() {
          carItems.add(items[position]);
        });
      },
      child: Text(
        'Agregar'.toUpperCase(),
        style: TextStyle(
          fontFamily: 'Impact',
          fontSize: 20.0,
        ),
      ),
    );
  }
}
