import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShareAccessPage extends StatefulWidget {

  ShareAccessPage({
    Key key,
    @required this.user
  }) : super(key: key);

  final FirebaseUser user;

  @override
  _ShareAccessPageState createState() => _ShareAccessPageState();
}

class _ShareAccessPageState extends State<ShareAccessPage> {  
  //final GlobalKey<FormState> 
    //_formkey = GlobalKey<FormState>();
     //need to link this to specific UID
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share Wallet Access'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
              onPressed: () {},
              child: Text('info'),
          ),
          RaisedButton(
              onPressed: () {},
              child: Text('your device info'),
          ),
          RaisedButton(
              onPressed: () {},
              child: Text('search for other users'),
          ),
        ],
      )
    );
  }
}