import 'package:flutter/material.dart';
import 'package:bluewallet/prop-config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:bluewallet/analyticsController.dart';
import 'package:bluewallet/Welcome/signup/controller.dart';

class SignUpPage extends StatefulWidget {
  final analyticsController analControl;

  SignUpPage({Key key, this.analControl})
      : super(key: key);
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends StateMVC<SignUpPage> {
  _SignUpPageState() : super(Controller()) {
    _con = Controller.con;
  }
  Controller _con;

  @override
  Widget build(BuildContext context) {
    widget.analControl.currentScreen('update_profile', 'updateProfileOver');
    return Scaffold(
        appBar: AppBar(
          title: Text(Prompts.signup),
          backgroundColor: Colors.teal,
        ),
        body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("https://images.alphacoders.com/588/thumb-1920-588588.jpg"),
            fit: BoxFit.fitHeight,
        ),),
      child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.all(25.0),
                child: Form(
                  key: _con.formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return Prompts.type_email;
                          }
                        },
                        onSaved: (input) => _con.set_email = input,
                        decoration: InputDecoration(labelText: Headers.email),
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.length < 6) {
                            return Prompts.passwrd_valid;
                          }
                        },
                        onSaved: (input) => _con.set_password = input,
                        decoration: InputDecoration(labelText: Prompts.passwrd),
                        obscureText: true,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: Userinfo.fullName),
                        maxLength: 32,
                        //validator: _con.validateName,
                        onSaved: (input) => _con.set_name = input,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: Userinfo.mobileNumber),
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        //validator: _con.validateMobile,
                        onSaved: (input) => _con.set_mobile = input,
                      ),
                      SizedBox(height: 15.0),
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
                              widget.analControl.sendAnalytics('profileUpdate');
                              widget.analControl.sendAnalytics('new_sign_up');
                              widget.analControl
                                  .currentScreen('sign_up', 'SignUpOver');
                              Controller.signUp(
                                  context, widget.analControl);
                            },
                            child: Text(Prompts.signup),
                          ))
                    ],
                  ),)
                ))));
  }
}