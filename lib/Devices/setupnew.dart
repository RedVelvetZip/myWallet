import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetupNewPage extends StatefulWidget {

  SetupNewPage({
    Key key,
    @required this.user
  }) : super(key: key);

  final FirebaseUser user;

  @override
  _SetupNewPageState createState() => _SetupNewPageState();
}

class _SetupNewPageState extends State<SetupNewPage> {  
  //final GlobalKey<FormState> 
//_formkey = GlobalKey<FormState>();
     //need to link this to specific UID
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New To SecureWallet'),
        backgroundColor: Colors.green,
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
              child: Text('Where can I get a Secure Device?'),
          ),
        ],
      )
    );
  }
}