import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiero_dulces/widgets/constants.dart';
import 'package:quiero_dulces/widgets/lateral_menu.dart';

class PaymentMethodPage extends StatelessWidget {
  static String id = 'payment_method_page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarNavigation(
          title: 'Métodos de Pago',
          colorFont: Colors.white,
          colorBackground: colorRojo,
        ),
        drawer: LateralMenu(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // _buildCreditCard(
                //   Color(0xFF090943),
                //   "3546 7532 XXXX 9742",
                //   "HOUSSEM SELMI",
                //   "08/2022",
                // ),
                Text(
                  'El vendedor acepta las siguientes formas de pago:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.credit_card_rounded,
                      color: colorRojo,
                      size: 30,
                    ),
                    title: Text(
                      'Pago con Tarjeta',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.moneyBill,
                      color: colorRojo,
                      size: 30,
                    ),
                    title: Text(
                      'Pago con Efectivo',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.piggyBank,
                      color: colorRojo,
                      size: 30,
                    ),
                    title: Text(
                      'Transferencia Bancaria',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.bitcoin,
                      color: colorRojo,
                      size: 30,
                    ),
                    title: Text(
                      'Pago con CriptoMonedas',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //floatingActionButton: _addPaymentMethod(),
      ),
    );
  }

  Card _buildCreditCard(Color color, String cardNumber, String cardHolder,
      String cardExpiration) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200.0,
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          bottom: 22.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogoBlock(),
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
              ),
              child: Text(
                '$cardNumber',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDetailsBlock(
                  'titular de la tarjeta'.toUpperCase(),
                  cardHolder,
                ),
                _buildDetailsBlock(
                  'valida hasta'.toUpperCase(),
                  cardExpiration,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildLogoBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/img/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "assets/img/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

  Column _buildDetailsBlock(String label, String cardHolder) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '$cardHolder',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _addPaymentMethod() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: colorRojo,
      child: Icon(FontAwesomeIcons.plus),
    );
  }
}
