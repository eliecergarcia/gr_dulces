import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiero_dulces/pages/categories_page.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool selectLogin = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFE0000),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Quiero \nDulces".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Impact',
                  ),
                ),
                SizedBox(
                  height: 35.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectLogin = true;
                        });
                      },
                      child: const Text(
                        'Registrate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectLogin = false;
                        });
                      },
                      child: const Text(
                        'Inicia Sesion',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                (selectLogin) ? _columnSignup() : _columnLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return _textFieldGeneral(
      labelText: 'Nombre',
      hintText: 'Eduardo Garcia',
      icon: Icons.person_outline,
      onChanged: (value) {},
    );
  }

  Widget _textFieldEmail() {
    return _textFieldGeneral(
      labelText: 'Correo',
      hintText: 'example@test.com',
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      icon: Icons.email_outlined,
    );
  }

  Widget _textFieldPassword() {
    return _textFieldGeneral(
      labelText: 'Contraseña',
      onChanged: (value) {},
      icon: Icons.lock_outline_rounded,
      obscureText: true,
    );
  }

  Widget _buttonSignUp() {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(10),
        backgroundColor: MaterialStateProperty.all(
          Color(0xffFF6969),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: 110,
            vertical: 15.0,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Text(
        'Registrarme',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 20.0,
        ),
      ),
      onPressed: () {},
    );
  }

  Widget _columnSignup() {
    return Column(
      children: [
        SizedBox(
          height: 25.0,
        ),
        _textFieldName(),
        SizedBox(
          height: 15.0,
        ),
        _textFieldEmail(),
        SizedBox(
          height: 15.0,
        ),
        _textFieldPassword(),
        SizedBox(
          height: 30.0,
        ),
        _buttonSignUp(),
      ],
    );
  }

  Widget _columnLogin() {
    return Column(
      children: [
        SizedBox(
          height: 15.0,
        ),
        _textFieldEmailLogin(),
        SizedBox(
          height: 15.0,
        ),
        _textFieldPasswordLogin(),
        SizedBox(
          height: 25.0,
        ),
        Text(
          'Olvidé mi Contraseña',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 65.0,
        ),
        _buttonLogin(),
      ],
    );
  }

  Widget _textFieldEmailLogin() {
    return _textFieldGeneral(
      labelText: 'Correo',
      hintText: 'example@test.com',
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      icon: Icons.email_outlined,
    );
  }

  Widget _textFieldPasswordLogin() {
    return _textFieldGeneral(
      labelText: 'Contraseña',
      onChanged: (value) {},
      icon: Icons.lock_outline_rounded,
      obscureText: true,
    );
  }

  Widget _buttonLogin() {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>(
          (states) => 10.0,
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => Color(0xffFF6969)),
        padding: MaterialStateProperty.resolveWith<EdgeInsets>(
          (states) => EdgeInsets.symmetric(
            horizontal: 40.0,
          ),
        ),
      ),
      child: Text(
        'Entrar'.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      onPressed: () {
        setState(() {
          Navigator.pushNamed(context, CategoriesPage.id);
        });
      },
    );
  }
}

// ignore: camel_case_types
class _textFieldGeneral extends StatelessWidget {
  final String labelText;
  final String hintText;
  final Function onChanged;
  final TextInputType keyboardType;
  final IconData icon;
  final bool obscureText;
  const _textFieldGeneral({
    @required this.labelText,
    this.hintText,
    @required this.onChanged,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: labelText,
          hintText: hintText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
