import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:bluewallet/settings/supportView.dart';


class Controller extends ControllerMVC {
  

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