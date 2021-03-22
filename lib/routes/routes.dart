import 'package:flutter/material.dart';
import 'package:quiero_dulces/pages/all_products.dart';
import 'package:quiero_dulces/pages/cart_page.dart';
import 'package:quiero_dulces/pages/categories_page.dart';
import 'package:quiero_dulces/pages/category_selected.dart';
import 'package:quiero_dulces/pages/coupons_page.dart';
import 'package:quiero_dulces/pages/history_page.dart';
import 'package:quiero_dulces/pages/login_page.dart';
import 'package:quiero_dulces/pages/payment_method_page.dart';

var customRoutes = <String, WidgetBuilder>{
  LoginPage.id: (context) => LoginPage(),
  CategoriesPage.id: (_) => CategoriesPage(),
  CategorySelectedPage.id: (_) => CategorySelectedPage(""),
  CarPage.id: (_) => CarPage(),
  PaymentMethodPage.id: (_) => PaymentMethodPage(),
  HistoryPage.id: (_) => HistoryPage(),
  CouponsPage.id: (_) => CouponsPage(),
  AllProductsPage.id: (_) => AllProductsPage(),
};
