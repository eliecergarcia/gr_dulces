import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:quiero_dulces/objects/cart_model.dart';
import 'package:quiero_dulces/pages/category_selected.dart';
import 'package:quiero_dulces/widgets/bottom_navigation.dart';
import 'package:quiero_dulces/widgets/constants.dart';
import 'package:quiero_dulces/widgets/lateral_menu.dart';

import 'cart_page.dart';

class CategoriesPage extends StatefulWidget {
  static String id = 'categories_page';

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    final carItems = Provider.of<CartModel>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
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
          backgroundColor: colorRojo,
        ),
        drawer: LateralMenu(),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: size.height / 12,
                color: colorRojo,
                child: Center(
                  child: Text(
                    'Menú'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              gestureDetectorCategory(
                  size, "Chocolates", Colors.white, colorRojo, () {
                navigateCategory('Chocolates');
              }),
              gestureDetectorCategory(size, 'paletas', colorRojo, Colors.white,
                  () {
                navigateCategory('paletas');
              }),
              gestureDetectorCategory(
                  size, 'con chile', Colors.white, colorRojo, () {
                navigateCategory('con chile');
              }),
              gestureDetectorCategory(size, 'Bolis', colorRojo, Colors.white,
                  () {
                navigateCategory('bolis');
              }),
              gestureDetectorCategory(size, 'botana', Colors.white, colorRojo,
                  () {
                navigateCategory('botana');
              }),
            ],
          ),
        ),
        bottomNavigationBar: MenuBottomNavigation(),
      ),
    );
  }

  void navigateCategory(String category) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CategorySelectedPage(category),
        ),
      );
    });
  }

  GestureDetector gestureDetectorCategory(Size size, String categoryText,
      Color colorBackground, Color colorText, Function onTap) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: size.height / 6,
        color: colorBackground,
        child: Center(
          child: Text(
            categoryText.toUpperCase(),
            style: TextStyle(
              color: colorText,
              fontWeight: FontWeight.bold,
              fontSize: 50.0,
              fontFamily: 'Impact',
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}

