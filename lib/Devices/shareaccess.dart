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
      appBar: AppBar(
        title: Text('Share Wallet Access'),
        backgroundColor: Colors.green,
      ),
      body:  Container(
        margin: EdgeInsets.all(15.0),
        child: Container(
        decoration: linearGradient,
        child: Column(
        
        //margin: EdgeInsets.all(15.0),
        children: <Widget>[ 
        Text("                                                     ",
        style: TextStyle(color: Colors.green, height: 1.4)),
        new DropdownButton<String>(
        items: <String>['A', 'B', 'C', 'D'].map((String value) {
           return new DropdownMenuItem<String>(
             value: value,
             child: new Text(value),
             );
         }).toList(),
        onChanged: (_) {},
        )

        ]),
      )
      )
    );
  }
}