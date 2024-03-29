import 'package:flutter/material.dart';
import 'package:bluewallet/prop-config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:bluewallet/Welcome/controller.dart';
import 'package:bluewallet/analyticsController.dart';

class WelcomePage extends StatefulWidget {

  final analyticsController thisAnalyticsController;

  WelcomePage({this.thisAnalyticsController});
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends StateMVC<WelcomePage> {
  _WelcomePageState() : super(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secure Wallet'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/circuits.jpg"),
            fit: BoxFit.fitHeight,
          ),
        ),
        
        child: Container(
          /*this is a decoration for a box that encompasses the two buttons. wont work at same time as background image
          height: 180,
          width: 310,
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(18))
            ),
          */
          //child: IntrinsicWidth( only works in Center class not Container??
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 250,
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
                    widget.thisAnalyticsController.sendAnalytics('login');
                    widget.thisAnalyticsController.currentScreen('welcome_page', 'WelcomePageOver');
                    Controller.NavigateToSignIn(context, widget.thisAnalyticsController);
                  },
                  child: Text(Prompts.login),
                  )),
              ButtonTheme(
                  minWidth: 250,
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
                    widget.thisAnalyticsController.sendAnalytics('sign_up');
                    widget.thisAnalyticsController.currentScreen('welcome_page', 'WelcomePageOver');
                    Controller.NavigateToSignUp(context, widget.thisAnalyticsController);
                  },
                  child: Text('     ' + Prompts.signup + '     '),
                  ))

              ],
            ),
          ),
          //),
       ),
     );
  }
}