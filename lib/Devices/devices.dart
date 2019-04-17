import 'package:flutter/material.dart';
import 'package:bluewallet/Devices/mydevices.dart';
import 'package:bluewallet/Devices/addremovedevices.dart';
import 'package:bluewallet/Devices/shareaccess.dart';
import 'package:bluewallet/Devices/accessothers.dart';
import 'package:bluewallet/Devices/setupnew.dart';
import 'package:bluewallet/analyticsController.dart';
import 'package:bluewallet/userController.dart';
import 'package:bluewallet/prop-config.dart';
import 'package:bluewallet/settings/controller.dart';


class DevicePage extends StatefulWidget {

  DevicePage({Key key, this.analControl, @required this.user})
      : super(key: key);

  final userController user;
  final analyticsController analControl;


  @override
  _DevicePageState createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
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
      body: Center(
        child: Container(
          decoration: linearGradient,
      //child: IntrinsicWidth(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ButtonTheme( 
              minWidth: 120,
            child: RaisedButton(
              color: Colors.red,
              splashColor: Colors.red[300],
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(20.0),
              elevation: 6,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  width: 2.0, 
                  color: Colors.deepPurple[800],
                ), 
                borderRadius: BorderRadius.circular(10), 
              ),
              onPressed: () { 
                     // Controller.NavigateToAddRemoveDevices(context);
              },
              child: Text('Add/Remove Device'),
          ),
          ),
          ButtonTheme( 
              minWidth: 120,
            child: RaisedButton(
              color: Colors.green,
              splashColor: Colors.red[300],
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(20.0),
              elevation: 6,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  width: 2.0, 
                  color: Colors.deepPurple[800],
                ), 
                borderRadius: BorderRadius.circular(10), 
              ),
              onPressed: () { 
                     // Controller.NavigateToShareDevices(context);
              },
              child: Text('Share Access'),
          ),
          ),
          ButtonTheme( 
              minWidth: 120,
            child: RaisedButton(
              color: Colors.teal,
              splashColor: Colors.red[300],
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(20.0),
              elevation: 6,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  width: 2.0, 
                  color: Colors.deepPurple[800],
                ), 
                borderRadius: BorderRadius.circular(10), 
              ),
              onPressed: () { 
                      //Controller.NavigateToSetupNew(context);
              },
              child: Text('How do I set up a new Secure Device?'),
          ),
          ),
          ButtonTheme( 
              minWidth: 120,
            child: RaisedButton(
              color: Colors.teal,
              splashColor: Colors.red[300],
              textTheme: ButtonTextTheme.primary,
              padding: EdgeInsets.all(20.0),
              elevation: 6,
              shape: BeveledRectangleBorder(
                side: BorderSide(
                  width: 2.0, 
                  color: Colors.deepPurple[800],
                ), 
                borderRadius: BorderRadius.circular(10), 
              ),
              onPressed: () { 
                      Controller.navigateToSupport(context);
              },
              child: Text(Prompts.support),
          ),
          )
        ],
      //),
      ),
      ),)
    );
  }
  // void NavigateToMyDevices() {
  //   Navigator.push(
  //     context, 
  //     MaterialPageRoute(
  //       builder: (context) => MyDevicesPage(),
  //       fullscreenDialog: true
  //     )
  //   );
  // }
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