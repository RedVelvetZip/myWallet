import 'package:flutter/material.dart';
import 'package:bluewallet/Devices/addremovedevices.dart';
import 'package:bluewallet/Devices/shareaccess.dart';
import 'package:bluewallet/Devices/setupnew.dart';
import 'package:bluewallet/userController.dart';
import 'package:bluewallet/prop-config.dart';
import 'package:bluewallet/Devices/supportView.dart';


class DevicePage extends StatefulWidget {

  DevicePage({Key key, @required this.user})
      : super(key: key);

  final userController user;
  //final analyticsController analControl;


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
    widget.user.load_data_from_firebase();
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
                      //print("${widget.user.email}");
                     navigateToAddRemoveDevices(context);
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
                     navigateToShareAccess(context);
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
                      navigateToSetupNew(context);
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
                      navigateToSupport(context);
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

  void navigateToAddRemoveDevices(context) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => AddRemoveDevicesPage(user: widget.user),
        fullscreenDialog: true
      )
    );
  }void navigateToShareAccess(context) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ShareAccessPage(user: widget.user),
        fullscreenDialog: true
      )
    );
  }
  void navigateToSetupNew(context) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => SetupNewPage(),
        fullscreenDialog: true
      )
    );
  }
  static void navigateToSupport
      (BuildContext context, ){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SupportPage(),
          fullscreenDialog: true
        )
      );
    }

}