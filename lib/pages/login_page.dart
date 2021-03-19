import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiero_dulces/block/provider.dart';
import 'package:quiero_dulces/pages/categories_page.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool selectLogin = true;
  final _auth = FirebaseApp.instance;

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderLogin.of(context);
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
                (selectLogin) ? _columnSignup(bloc) : _columnLogin(bloc),
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

  Widget _textFieldEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _textFieldGeneral(
          labelText: 'Correo',
          hintText: 'Eduardo Garcia',
          icon: Icons.email_outlined,
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget _textFieldPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _textFieldGeneral(
          labelText: 'Contraseña',
          icon: Icons.lock_outline_rounded,
          obscureText: true,
          onChanged: bloc.changePassword,
          errorText: snapshot.error,
        );
      },
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

  Widget _columnSignup(LoginBloc bloc) {
    return Column(
      children: [
        SizedBox(
          height: 25.0,
        ),
        _textFieldName(),
        SizedBox(
          height: 15.0,
        ),
        _textFieldEmail(bloc),
        SizedBox(
          height: 15.0,
        ),
        _textFieldPassword(bloc),
        SizedBox(
          height: 30.0,
        ),
        _buttonSignUp(),
      ],
    );
  }

  Widget _columnLogin(LoginBloc bloc) {
    return Column(
      children: [
        SizedBox(
          height: 15.0,
        ),
        _textFieldEmailLogin(bloc),
        SizedBox(
          height: 15.0,
        ),
        _textFieldPasswordLogin(bloc),
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

  Widget _textFieldEmailLogin(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _textFieldGeneral(
          labelText: 'Correo',
          hintText: 'ejemplo@correo.com',
          icon: Icons.mail_outline,
          onChanged: bloc.changeEmail,
          errorText: snapshot.error,
        );
      },
    );
  }

  Widget _textFieldPasswordLogin(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _textFieldGeneral(
          labelText: 'Contraseña',
          icon: Icons.lock_outline_rounded,
          obscureText: true,
          onChanged: bloc.changePassword,
          errorText: snapshot.error,
        );
      },
    );
  }

  Widget _buttonLogin() {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>(
          (states) => 10.0,
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
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

  //void _addUser() {}
  void _showEmptyTextField() {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(
              "No se  Permiten Campos Vacios",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Rellene todos los campos',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                style: ButtonStyle(
                  elevation:
                      MaterialStateProperty.resolveWith((states) => 10.0),
                  // backgroundColor: MaterialStateProperty.resolveWith(
                  //   (states) => colorBlack,
                  // ),
                ),
                onPressed: () => Navigator.pop(context),
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text(
              "No se  Permiten Campos Vacios",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            content: Text(
              'Rellene todos los campos',
              textAlign: TextAlign.center,
            ),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Ok'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    }
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
  final String errorText;
  const _textFieldGeneral({
    @required this.labelText,
    this.hintText,
    @required this.onChanged,
    this.keyboardType,
    this.icon,
    this.obscureText = false,
    this.errorText,
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
          errorText: errorText,
          prefixIcon: Icon(icon),
          labelText: labelText,
          hintText: hintText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
