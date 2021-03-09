import 'package:flutter/material.dart';

const Color colorRojo = Color(0xffFE0000);
const Color colorBlack = Color(0xFF081603);

class TextMenuLateral extends StatelessWidget {
  final String text;
  TextMenuLateral({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
  }
}

class ListTileMenu extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function function;
  ListTileMenu({
    this.function,
    this.icon,
    this.text,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.redAccent,
      ),
      title: TextMenuLateral(
        text: text,
      ),
      onTap: function,
    );
  }
}

class AppBarNavigation extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
  final String title;
  final List<Widget> actions;
  final Color colorBackground;
  final Color colorFont;
  AppBarNavigation({
    this.title,
    this.actions,
    this.colorFont = Colors.black,
    this.colorBackground = colorRojo,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      title: Text(
        title,
        style: TextStyle(
          color: colorFont,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: colorBackground,
      actions: actions,
    );
  }
}
