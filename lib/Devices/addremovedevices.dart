import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddRemoveDevicesPage extends StatefulWidget {

  AddRemoveDevicesPage({
    Key key,
    @required this.user
  }) : super(key: key);

  final FirebaseUser user;

  @override
  _AddRemoveDevicesPageState createState() => _AddRemoveDevicesPageState();
}

class _AddRemoveDevicesPageState extends State<AddRemoveDevicesPage> {  
  //String _name, _age, _gender, _occupation, _mobile;
  //final GlobalKey<FormState> 
    //_formkey = GlobalKey<FormState>();
     //need to link this to specific UID
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Remove Devices'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {},
                  child: Text("Add"),
                ),
                RaisedButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Remove",
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}