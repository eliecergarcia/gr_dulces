import 'package:flutter/material.dart';
import 'package:quiero_dulces/widgets/constants.dart';
import 'package:quiero_dulces/widgets/lateral_menu.dart';

class LocationPage extends StatelessWidget {
  static String id = 'location_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorRojo,
      ),
      drawer: LateralMenu(),
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
