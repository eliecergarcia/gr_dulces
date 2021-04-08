import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiero_dulces/block/provider.dart';
import 'package:quiero_dulces/pages/login_page.dart';
import 'package:quiero_dulces/routes/routes.dart';

import 'objects/cart_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      child: ProviderLogin(
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
          routes: customRoutes,
        ),
      ),
    );
  }
}
