import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetupNewPage extends StatefulWidget {

  SetupNewPage({
    Key key,
  //  @required this.user
  }) : super(key: key);

  //final FirebaseUser user;
  
  @override
  _SetupNewPageState createState() => _SetupNewPageState();
}

class _SetupNewPageState extends State<SetupNewPage> {  
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
        title: Text('New To SecureWallet'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: linearGradient,
        child: Container(
        
        margin: EdgeInsets.all(15.0),
        child: 
        Text("SecureWallet is a product that will protect your personal info as well as physical assets.\n\nWith location tracking services, radio-frequency identification (RFID) scan protection, a solenoid lock mechanism, and login verification through this app, you can feel Secure!\n\nIf you'd like to set up a new device, you need the product key on the packaging. On the settings tab, you click on 'Add/Remove Device'. Once there, enter the email address of the SecureWallet App account that you'd like to link the device to. This info will be added to our firebase database, listing that email as the owner of the device.\n\nOther users can be given access to your device. As the owner of a device, you can go to the 'Share Access' tab in settings, and add the email of any user account that you'd like to extend access of your device to. Be careful who you share access with!",
          style: TextStyle(color: Colors.green, height: 1.4))
        ),
      )
    );
  }
}