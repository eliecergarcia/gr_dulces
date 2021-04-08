import 'dart:async';
import 'package:quiero_dulces/block/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  //login
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  //signup
  final _emailSignUpController = BehaviorSubject<String>();
  final _passwordSignUpController = BehaviorSubject<String>();
  final _rePasswordSignUpController = BehaviorSubject<String>();

  // Recuperar los datos del Stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);
  Stream<String> get emailSignUp => _emailSignUpController.stream.transform(validarEmail);
  Stream<String> get passwordSignUpStream =>
      _passwordSignUpController.stream.transform(validarPassword);
  Stream<String> get rePasswordSignUpStream =>
      _rePasswordSignUpController.stream.transform(validarPassword);



  Stream<bool> get formValidStream =>
      Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

  // Insertar valores al Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Function(String) get changeMailSignUp => _emailSignUpController.sink.add;
  Function(String) get changePasswordSignUp => _passwordSignUpController.sink.add;
  Function(String) get changeRePasswordSignUp => _rePasswordSignUpController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get email => _emailController.value;
  String get password => _passwordController.value;
  String get emailSign => _emailSignUpController.value;
  String get passwordSign => _passwordSignUpController.value;
  String get rePasswordSign => _rePasswordSignUpController.value;


  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _emailSignUpController?.close();
    _passwordSignUpController?.close();
    _rePasswordSignUpController?.close();
  }
}
