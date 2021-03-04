import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiero_dulces/objects/cart_model.dart';
import 'package:quiero_dulces/objects/product.dart';
import 'package:quiero_dulces/widgets/constants.dart';
import 'package:quiero_dulces/widgets/lateral_menu.dart';

import 'cart_page.dart';

class CategorySelectedPage extends StatefulWidget {
  static String id = 'category_selected';
  final String category;
  CategorySelectedPage(this.category);
  @override
  _CategorySelectedPageState createState() => _CategorySelectedPageState();
}

final productReference = FirebaseDatabase.instance.reference().child('dulces');

class _CategorySelectedPageState extends State<CategorySelectedPage> {
  TextEditingController _categoryController;
  List<Product> items;
  StreamSubscription<Event> _onProductAddedSubscription;
  StreamSubscription<Event> _onProductChangeSubscription;

  @override
  void initState() {
    items = [];
    _categoryController =
        TextEditingController(text: widget.category.toString());
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
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final carItems = Provider.of<CartModel>(context);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: colorRojo,
            title: Text(
              '${_categoryController.text}'.toUpperCase(),
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Impact',
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                  icon: Icon(FontAwesomeIcons.cartPlus),
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, CarPage.id);
                    });
                  },
                ),
              ),
            ],
          ),
          drawer: LateralMenu(),
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int position) {
                  if (items[position].category == _categoryController.text) {
                    return _cardProduct(position);
                  } else {
                    return SizedBox.shrink();
                  }
                }, childCount: items.length),
              ),
            ],
          )),
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
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Flexible(
            child: Text('data'),
          ),
        ],
      ),
    );
  }
}
