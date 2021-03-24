import 'package:flutter/material.dart';
import 'package:quiero_dulces/widgets/bottom_navigation.dart';
import 'package:quiero_dulces/widgets/constants.dart';

class SearchPage extends StatelessWidget {
  static String id = 'search_page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorRojo,
        ),
        body: Center(
          child: Text('data'),
        ),
        bottomNavigationBar: MenuBottomNavigation(),
      ),
    );
  }
}
