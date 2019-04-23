import 'package:flutter/material.dart';
import 'package:bluewallet/Devices/controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bluewallet/userController.dart';

class ShareAccessPage extends StatefulWidget {

  ShareAccessPage({
    Key key,
    @required this.user
  }) : super(key: key);

  final userController user;
  @override
  _ShareAccessPageState createState() => _ShareAccessPageState();
}

class _ShareAccessPageState extends StateMVC<ShareAccessPage> {  
  _ShareAccessPageState() : super(Controller()){
   _con = Controller.con;
   _con.setTextListener();
    devlist = _con.interests;
  }
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
    List _devices = ["206369082", "98:D3:71:FD:51:8E"];
    List devlist;
    List<dynamic> _userDevices;
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedDevice, _otheremail;

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_devices);
    _selectedDevice = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List devices) {
    List<DropdownMenuItem<String>> items = new List();
    for (String device in devices) {
      items.add(new DropdownMenuItem(value: device, child: new Text(device)));
    }
    return items;
  }

  void changedDropDownItem(String selectedDevice) {
    setState(() {
      _selectedDevice = selectedDevice;
    });
}
  @override
  Widget build(BuildContext context) {
    widget.user.load_data_from_firebase();
    //List<String> _thisusersdevs = widget.user.devices;
    _userDevices = widget.user.devices;
     return Scaffold(
      appBar: AppBar(
        title: Text('Share Wallet Access'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
        decoration: linearGradient,
        constraints: BoxConstraints.expand(height:520),
        child: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[ 
        Text("Choose one of your devices to share: ",
            style: TextStyle(color: Colors.white, height: 1.4)),
        Text("    ",
            style: TextStyle(color: Colors.green, height: 1.4)),
        new DropdownButton(
                value: _selectedDevice,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
        ),
        Padding(
                    padding: EdgeInsets.all(25.0)
                  ),
        Text("Enter the email of the user you'd like to extend/revoke access to: ",
            style: TextStyle(color: Colors.white, height: 1.4)),
            Padding(
                    padding: EdgeInsets.all(15.0)
                  ),
        Row(children: <Widget>[
              Expanded( 
                child: TextField(
                    decoration: InputDecoration(
                      hintText: "Other User Email",
                      fillColor: Colors.white
                      
                    ),
                    onChanged: (input) => _otheremail = input,
                ),
              ),
              Icon(
                Icons.add,
                color: Colors.white,
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
             
            RaisedButton(
              color: Colors.red[800],
              splashColor: Colors.red[300],
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              elevation: 6,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  width: 2.0, 
                  color: Colors.deepPurple[800],
                ), 
                borderRadius: BorderRadius.circular(10), 
              ),
              onPressed: () {
                  //YOU HAVE DEV NAME, NEED devID NOW
                    Firestore.instance.collection("devices").document("${_selectedDevice}").updateData({
                      "otheraccess": FieldValue.arrayUnion(["$_otheremail"])
                    });
                    //ADD TO USER COLLECTION FOR THIS EMAIL
                    Firestore.instance.collection("users").document("${_otheremail}").updateData({
                      "hasaccessto": FieldValue.arrayUnion(["$_selectedDevice"])
                    });

                  },
                  child: Text("Share Access"),
                ),
                Padding(
                    padding: EdgeInsets.all(10.0)
                  ),
                RaisedButton(
              color: Colors.red[800],
              splashColor: Colors.red[300],
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              elevation: 6,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  width: 2.0, 
                  color: Colors.deepPurple[800],
                ), 
                borderRadius: BorderRadius.circular(10), 
              ),
              onPressed: () {
                    Firestore.instance.collection("devices").document("${_selectedDevice}").updateData({
                      "otheraccess": FieldValue.arrayRemove(["$_otheremail"])
                    });
                    //ADD TO USER COLLECTION FOR THIS EMAIL
                  },
                  child: Text("Revoke Access"),
                )
        ])

        ]),       
      )
      )
      )    
     );
  }
}