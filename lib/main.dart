import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiero_dulces/pages/cart_page.dart';
import 'package:quiero_dulces/pages/categories_page.dart';
import 'package:quiero_dulces/pages/category_selected.dart';
import 'package:quiero_dulces/pages/coupons_page.dart';
import 'package:quiero_dulces/pages/history_page.dart';
import 'package:quiero_dulces/pages/login_page.dart';
import 'package:quiero_dulces/pages/payment_method_page.dart';

import 'objects/cart_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'AvenirLTstd',
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryIconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (_) => LoginPage(),
          CategoriesPage.id: (_) => CategoriesPage(),
          CategorySelectedPage.id: (_) => CategorySelectedPage(""),
          CarPage.id: (_) => CarPage(),
          PaymentMethodPage.id: (_) => PaymentMethodPage(),
          HistoryPage.id: (_) => HistoryPage(),
          CouponsPage.id: (_) => CouponsPage(),
        },
      ),
    );
  }
}
