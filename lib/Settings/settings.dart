import 'package:flutter/material.dart';
import 'package:bluewallet/prop-config.dart';
import 'package:bluewallet/userController.dart';
import 'package:bluewallet/settings/controller.dart';
import 'package:bluewallet/analyticsController.dart';

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
  var linearGradient = const BoxDecoration(
      gradient: const LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: <Color>[
          const Color(0xFF413070),
          const Color(0xFF2B264A),
        ],
      ),
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: linearGradient,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ButtonTheme( 
              minWidth: 120,
            child: RaisedButton(
              color: Colors.red[800],
              splashColor: Colors.red[300],
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(20.0),
              elevation: 6,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  width: 2.0, 
                  color: Colors.deepPurple[800],
                ), 
                borderRadius: BorderRadius.circular(10), 
              ),
              onPressed: () {},
              child: Text(Headers.settings),
          ),
          ),
          ButtonTheme( 
              minWidth: 120,
            child: RaisedButton(
              color: Colors.red[800],
              splashColor: Colors.red[300],
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(20.0),
              elevation: 6,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  width: 2.0, 
                  color: Colors.deepPurple[800],
                ), 
                borderRadius: BorderRadius.circular(10), 
              ),
              onPressed: () { 
                      Controller.navigateToSupport(context);
              },
              child: Text(Prompts.support),
          ),
          )
        ],
      ),
        ),
      ),
    );
  

  }
}