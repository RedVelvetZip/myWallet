import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bluewallet/Profile/View/updateView.dart';
import 'package:bluewallet/Profile/View/editInterestsView.dart';
import 'package:bluewallet/analyticsController.dart';
import 'package:bluewallet/userController.dart';

class Controller extends ControllerMVC {
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }
  static Controller _this;

  Controller._();

  static Controller get con => _this;


  Future NavigateToUpdateProfile(BuildContext context,
      analyticsController analControl, userController user) async {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                UpdateProfilePage(user: user, analControl: analControl),
            fullscreenDialog: true));
  }

  Future NavigateToEditInterests(BuildContext context,
      analyticsController analControl, userController user) async {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EditInterestsPage(user: user, analControl: analControl),
            fullscreenDialog: true));
  }
}