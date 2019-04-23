import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bluewallet/Devices/controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bluewallet/userController.dart';

class ShareAccessPage extends StatefulWidget {

  ShareAccessPage({
    Key key,
    @required this.user
  }) : super(key: key);

  //final FirebaseUser user;
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
    List _devices = ["Brad's Wallet", "Wallet #2", "Brad's briefcase"];
    //Firestore.instance.collection('users').document('567890').get();
    
    List devlist;
  

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedDevice;

  @override
  //widget.user.load_data_from_firebase();
  //List<String> names = widget.user.devices;
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
     return Scaffold(
      appBar: AppBar(
        title: Text('Share Wallet Access'),
        backgroundColor: Colors.green,
      ),
      body:  Container(
        decoration: linearGradient,
        
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
                child: TextFormField(
                  controller: _con.textController,
                  decoration: InputDecoration(
                    hintText: "other user email",
                  ),
                  maxLength: 32,
                  onEditingComplete: () => {
                    _con.addInterest(widget.user),
                    _con.textController.clear(),
                    setState((){
                      devlist = _con.interests;
                    })
                  },  
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => {
                  _con.addInterest(widget.user),
                  _con.textController.clear(),
                  setState((){
                    devlist = _con.interests;
                  })
                },
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
                    //widget.analControl.sendAnalytics('profileUpdate');
                    //_con.update(widget.user);
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
                    //widget.analControl.sendAnalytics('profileUpdate');
                    //_con.update(widget.user);
                  },
                  child: Text("Revoke Access"),
                )
        ])

        ]),       
      )
      )
    
     );
  }
  
}
// class DevList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new StreamBuilder(
//       stream: Firestore.instance.collection('users').snapshots,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) return new Text('Loading...');
//         return new ListView(
//           children: snapshot.data.documents.map((document) {
//             return new ListTile(
//               title: new Text(document['title']),
//               subtitle: new Text(document['type']),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }