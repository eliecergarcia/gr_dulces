import 'package:firebase_database/firebase_database.dart';
import 'package:quiero_dulces/objects/product.dart';

class Order {
  String _id;
  String _clientName;
  List<Product> _productOrder;
  int _total;
  String _street;
  String _cologne;
  int _phoneNumber;

  Order(this._clientName, this._cologne, this._id, this._phoneNumber,
      this._productOrder, this._street, this._total);

  Order.map(dynamic obj) {
    this._clientName = obj['client-name'];
    this._productOrder = obj['product-order'];
    this._total = obj['total'];
    this._street = obj['street'];
    this._cologne = obj['cologne'];
    this._phoneNumber = obj['phone-number'];
  }
  String get id => _id;
  String get clientName => _clientName;
  List<Product> get productOrder => _productOrder;
  int get total => _total;
  String get street => _street;
  String get cologne => _cologne;
  int get phoneNumber => _phoneNumber;

  Order.fromSnapShot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _clientName = snapshot.value['client-name'];
    _productOrder = snapshot.value['product-order'];
    _total = snapshot.value['total'];
    _street = snapshot.value['street'];
    _cologne = snapshot.value['cologne'];
    _phoneNumber = snapshot.value['phone-number'];
  }
}
