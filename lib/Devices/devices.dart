import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bluewallet/Devices/mydevices.dart';
import 'package:bluewallet/Devices/addremovedevices.dart';
import 'package:bluewallet/Devices/shareaccess.dart';
import 'package:bluewallet/Devices/accessothers.dart';
import 'package:bluewallet/Devices/setupnew.dart';
import 'package:bluewallet/analyticsController.dart';
import 'package:bluewallet/userController.dart';


class DevicePage extends StatefulWidget {

  DevicePage({Key key, this.analControl, @required this.user})
      : super(key: key);

  final userController user;
  final analyticsController analControl;


  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
  //bool _isButtonDisabled = true;
  //_isButtonDisabled ? true : (some page)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: IntrinsicWidth(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
              onPressed: NavigateToMyDevices,
              child: Text('My Devices'),
              color: Colors.deepOrange,
              textColor: Colors.white,
          ),
          RaisedButton(
              onPressed: NavigateToAddRemoveDevices,
              child: Text('Add/Remove Device'),
              color: Colors.indigo,
              textColor: Colors.white,
          ),
          RaisedButton(
              onPressed: NavigateToShareAccess,
              child: Text('I want to share access'),
              color: Colors.teal,
              textColor: Colors.white,
          ),
          RaisedButton(
              onPressed: NavigateToAccessOthers,
              child: Text('I want to access a wallet that is not mine'),
              color: Colors.teal,
              textColor: Colors.white,
          ),
          RaisedButton(
              onPressed: NavigateToSetupNew,
              child: Text('I need to setup my new Secure Wallet!'),
              color: Colors.green,
              textColor: Colors.white,
          ),
        ],
      ),
      ),
      ),
    );
  }
  void NavigateToMyDevices() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => MyDevicesPage(),
        fullscreenDialog: true
      )
    );
  }
  void NavigateToAddRemoveDevices() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => AddRemoveDevicesPage(),
        fullscreenDialog: true
      )
    );
  }void NavigateToShareAccess() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ShareAccessPage(),
        fullscreenDialog: true
      )
    );
  }
  void NavigateToAccessOthers() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => AccessOthersPage(),
        fullscreenDialog: true
      )
    );
  }
  void NavigateToSetupNew() {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => SetupNewPage(),
        fullscreenDialog: true
      )
    );
  }

}