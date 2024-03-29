import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:bluewallet/Welcome/login/view.dart';
import 'package:bluewallet/Welcome/signup/view.dart';
import 'package:bluewallet/analyticsController.dart';


class Controller extends ControllerMVC {
  static void NavigateToSignIn(
    BuildContext context, 
    analyticsController thisAnalyticsController){
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => LoginPage(analControl: thisAnalyticsController),
          fullscreenDialog: true
        )
      );
    }

  static void NavigateToSignUp(
    BuildContext context,
    analyticsController thisAnalyticsController){
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => SignUpPage(analControl: thisAnalyticsController),
          fullscreenDialog: true
        )
      );
    }
}