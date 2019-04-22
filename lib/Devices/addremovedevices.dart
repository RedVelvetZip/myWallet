import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bluewallet/prop-config.dart';
import 'package:bluewallet/analyticsController.dart';
import 'package:bluewallet/userController.dart';
import 'package:bluewallet/Devices/controller.dart';

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
        title: Text('Add/Remove Devices'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: linearGradient,
        child: Container(
          margin: EdgeInsets.all(15.0),
        child: Column(
        
        children: <Widget>[ 
        Text("To register a new device, you'll need the product key on the packaging.  ",
          style: TextStyle(color: Colors.green, height: 1.4)),
        

        TextFormField(
                    decoration: InputDecoration(
                      hintText: "Product ID",
                      fillColor: Colors.white
                      //labelText: "widget.user.mobile"
                    ),
                    //onSaved: (input) => _con.set_mobile = input,
                ),
                SizedBox(height: 15.0),

                RaisedButton(
              color: Colors.red[800],
              splashColor: Colors.red[300],
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              elevation: 6,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  width: 2.0, 
                  color: Colors.deepPurple[800],
                ), 
                borderRadius: BorderRadius.circular(10), 
              ),
              onPressed: () {
                    //widget.analControl.sendAnalytics('profileUpdate');
                    //_con.update(widget.user);
                  },
                  child: Text("Add Device"),
                )
        ]),
      )
      )
    );
  }
}