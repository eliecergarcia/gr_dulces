import 'package:flutter/material.dart';

import 'package:quiero_dulces/routes/routes.dart';

import 'constants.dart';

class LateralMenu extends StatefulWidget {
  const LateralMenu({
    Key key,
  }) : super(key: key);

  @override
  _LateralMenuState createState() => _LateralMenuState();
}

class _LateralMenuState extends State<LateralMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img/logodulces.png'),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              leading: Icon(
                Icons.lock_outlined,
                color: colorRojo,
              ),
              title: Text('Cerrar Sesion'),
              trailing: Switch.adaptive(
                value: true,
                activeColor: colorRojo,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, i) => Divider(
          color: Colors.blue,
        ),
        itemCount: drawerRoutes.length,
        itemBuilder: (context, i) => ListTile(
          title: Text('${drawerRoutes[i].titulo}'),
          leading: Icon(
            drawerRoutes[i].icon,
            color: colorRojo,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => drawerRoutes[i].page,
              ),
            );
          },
        ),
      ),
    );
  }
}
