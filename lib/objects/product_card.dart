import 'package:flutter/foundation.dart';

class ProductCard extends ChangeNotifier {
  ProductCard(
    this.category,
    this.cuantity,
    this.description,
    this.id,
    this.name,
    this.price,
    this.cuantityOrder,
  );

  String id;
  String name;
  int price;
  int cuantity;
  int cuantityOrder;
  String description;
  String category;
}
