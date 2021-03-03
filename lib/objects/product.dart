import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class Product extends ChangeNotifier {
  Product(this._id, this._name, this._price, this._cuantity, this._description,
      this._category);

  String _id;
  String _name;
  int _price;
  int _cuantity;
  String _description;
  String _category;

  Product.map(dynamic obj) {
    this._name = obj['name'];
    this._price = obj['price'];
    this._cuantity = obj['cuantity'];
    this._description = obj['description'];
    this._category = obj['category'];
    notifyListeners();
  }

  String get id => _id;
  String get name => _name;
  int get price => _price;
  int get cuantity => _cuantity;
  String get description => _description;
  String get category => _category;

  Product.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _name = snapshot.value['name'];
    _price = snapshot.value['price'];
    _cuantity = snapshot.value['cuantity'];
    _description = snapshot.value['description'];
    _category = snapshot.value['category'];
    notifyListeners();
  }
}
