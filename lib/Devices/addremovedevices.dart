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
 // _AddRemoveDevicesPageState() : super(Controller()) {
  //  _con = Controller.con;
  //}
  Controller _con; 
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[ 
        Text("To register a new device, you'll need the product key on the packaging.  ",
          style: TextStyle(color: Colors.green, height: 1.4)),
        

        TextFormField(
                    decoration: InputDecoration(
                      hintText: "Product ID",
                      fillColor: Colors.white
                      //labelText: "widget.user.mobile"
                    ),
                    onSaved: (input) => _con.set_ID = input,
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
                ),
                Padding(
                    padding: EdgeInsets.all(25.0)
                  ),
                Text("By hitting 'Add Device' you will register your product in our database with yourself as the primary owner. Access can be shared to other users in the 'Share Access' tab in settings, but you will be the owner while all others just have shared access.  ",
          style: TextStyle(color: Colors.green, height: 1.4)),
        ]),
      )
      )
    );
  }
}