import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quiero_dulces/block/provider.dart';
import 'package:quiero_dulces/widgets/alert_dialog.dart';
import 'package:quiero_dulces/widgets/bottom_navigation.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool selectLogin = true;
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderLogin.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFE0000),
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Center(
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
                          'Inicia Sesion',
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
                          'Registrate',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  (selectLogin) ? _columnLogin(bloc) : _columnSignup(bloc),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _textFieldName() {
  //   return _textFieldGeneral(
  //     labelText: 'Nombre',
  //     hintText: 'Eduardo Garcia',
  //     icon: Icons.person_outline,
  //     onChanged: (value) {},
  //   );
  // }

  Widget _textFieldEmail(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.emailSignUp,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _textFieldGeneral(
          labelText: 'Correo',
          hintText: 'Eduardo Garcia',
          icon: Icons.email_outlined,
          onChanged: bloc.changeMailSignUp,
          errorText: snapshot.error,
        );
      },
    );
  }

  Widget _textFieldPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordSignUpStream,
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

  Widget _textFieldPasswordSign(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.rePasswordSignUpStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return _textFieldGeneral(
          labelText: 'Reingresa la Contraseña',
          icon: Icons.lock_outline_rounded,
          obscureText: true,
          onChanged: bloc.changeRePasswordSignUp,
          errorText: snapshot.error,
        );
      },
    );
  }

  Widget _buttonSignUp(LoginBloc bloc) {
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
      onPressed: () async {
        print("${bloc.emailSign} y ${bloc.rePasswordSign}");
        setState(() {
          showSpinner = true;
        });
        if (bloc.emailSign == null) {
          _showEmptyTextField();
          showSpinner = false;
        } else if (bloc.rePasswordSign == null) {
          _showEmptyTextField();
          showSpinner = false;
        } else {
          try {
            final user = await _auth.createUserWithEmailAndPassword(
              email: bloc.emailSign,
              password: bloc.rePasswordSign,
            );
            if (user != null) {
              showSpinner = false;
              _addUser();
            }
            setState(() {
              showSpinner = false;
            });
          } catch (e) {}
        }
      },
    );
  }

  Widget _columnSignup(LoginBloc bloc) {
    return Column(
      children: [
        // SizedBox(
        //   height: 25.0,
        // ),
        // _textFieldName(),
        SizedBox(
          height: 15.0,
        ),
        _textFieldEmail(bloc),
        SizedBox(
          height: 15.0,
        ),
        _textFieldPassword(bloc),
        SizedBox(
          height: 15.0,
        ),
        _textFieldPasswordSign(bloc),
        SizedBox(
          height: 30.0,
        ),
        _buttonSignUp(bloc),
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
        _buttonLogin(bloc),
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

  Widget _buttonLogin(LoginBloc bloc) {
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
      onPressed: () async {
        if (bloc.password == null || bloc.email == null) {
          _showEmptyTextField();
          setState(() {
            showSpinner = false;
          });
        } else if (bloc.password != null && bloc.email != null) {
          setState(() {
            showSpinner = true;
          });
          try {
            // prefs.email = bloc.email;
            // prefs.password = bloc.password;
            final user = await _auth.signInWithEmailAndPassword(
                email: bloc.email, password: bloc.password);
            if (user != null) {
              Navigator.pushNamed(context, MenuBottomNavigation.id);
            }
            setState(() {
              showSpinner = false;
            });
          } catch (e) {
            //print('$e');
            _errorLogin();
            setState(() {
              showSpinner = false;
            });
          }
        }
      },
    );
  }

  void _errorLogin() {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertContent(
            'Error al Ingresar',
            'Vuelva a intentarlo',
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoDialogText(
            context: context,
            contentTitle: 'Error al Ingresar',
            textTitle: 'Vuelva a intentarlo',
          );
        },
      );
    }
  }

  void _addUser() {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertContent(
            'Te registraste de manera Exitosa',
            "Bienvenido!",
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoDialogText(
            context: context,
            contentTitle: 'Te registraste de manera Exitosa',
            textTitle: 'Bienvenido!',
          );
        },
      );
    }
  }

  void _showEmptyTextField() {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertContent(
            'Rellene todos los campos',
            "No se permiten campos vacios",
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) {
          return CupertinoDialogText(
            context: context,
            contentTitle: 'Rellene todos los campos',
            textTitle: 'No se permiten campos vacios',
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
