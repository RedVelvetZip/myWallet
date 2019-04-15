import 'package:flutter/material.dart';
import 'package:bluewallet/bluetooth/bluetooth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bluewallet/Welcome/view.dart';
import 'package:bluewallet/analyticsController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future <Map<PermissionGroup, PermissionStatus>> permissions = 
    PermissionHandler().
      requestPermissions([PermissionGroup.location, PermissionGroup.mediaLibrary]);
  
  Function() {
    print(PermissionStatus.values);
  }
  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      title: 'SecureWallet Login',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      navigatorObservers: <NavigatorObserver>[_analyticsController.observer],
      home: WelcomePage(
        thisAnalyticsController: _analyticsController),
    );
    return materialApp;
  }
}

  //   var materialApp = MaterialApp(
  //     title: 'SecureWallet Login',
  //     theme: ThemeData(
  //       primarySwatch: Colors.red,
  //     ),
  //     navigatorObservers: <NavigatorObserver>[_analyticsController.observer],
  //     home: WelcomePage(
  //       thisAnalyticsController: _analyticsController),
  //   );
  //   return materialApp;
  // }

  //   return MaterialApp(
  //     title: 'Testing SecureWallet Blu',
  //     theme: ThemeData(
  //       primarySwatch: Colors.purple,
  //     ),
  //     home: BluetoothApp(),
  //   );
  // }