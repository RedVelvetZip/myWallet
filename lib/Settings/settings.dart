import 'package:flutter/material.dart';
import 'package:bluewallet/prop-config.dart';
import 'package:bluewallet/analyticsController.dart';
import 'package:bluewallet/userController.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({
    Key key,
    this.analControl,
    @required this.user 
  }) : super(key: key);

  final userController user;
  final analyticsController analControl;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
              onPressed: () {},
              child: Text(Headers.settings),
          ),
          RaisedButton(
              onPressed: () {},
              child: Text(widget.user.name),
          ),
        ],
      ),
    );
  }
}