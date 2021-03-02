import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiero_dulces/widgets/constants.dart';

class CategoriesPage extends StatelessWidget {
  static String id = 'categories_page';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                icon: Icon(FontAwesomeIcons.cartPlus),
                onPressed: () {},
              ),
            ),
          ],
          backgroundColor: colorRojo,
        ),
        drawer: Drawer(),
        body: SingleChildScrollView(
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
                  size, "Chocolates", Colors.white, colorRojo),
              gestureDetectorCategory(size, 'paletas', colorRojo, Colors.white),
              gestureDetectorCategory(
                  size, 'con chile', Colors.white, colorRojo),
              gestureDetectorCategory(size, 'Bolis', colorRojo, Colors.white),
              gestureDetectorCategory(size, 'botana', Colors.white, colorRojo),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector gestureDetectorCategory(
      Size size, String categoryText, Color colorBackground, Color colorText) {
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
      onTap: () {
        print(categoryText);
      },
    );
  }
}
