import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertContent extends StatelessWidget {
  String titleText;
  String contentText;
  AlertContent(this.contentText, this.titleText);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text(
        titleText,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      content: Text(
        contentText,
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Ok'),
        ),
      ],
    );
  }
}

class CupertinoDialogText extends StatelessWidget {
  final String textTitle;
  final String contentTitle;
  const CupertinoDialogText({
    @required this.context,
    @required this.contentTitle,
    @required this.textTitle,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        textTitle,
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      content: Text(
        contentTitle,
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
  }
}
