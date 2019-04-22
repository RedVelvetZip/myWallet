import 'package:flutter/material.dart';
import 'package:bluewallet/prop-config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bluewallet/userController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bluewallet/Welcome/login/view.dart';
import 'package:bluewallet/analyticsController.dart';

class Controller extends ControllerMVC {
  factory Controller() {
    if (_this == null) _this = Controller._();
    return _this;
  }
  static Controller _this;

  Controller._();

  static String productID;

  GlobalKey<FormState> get formkey => _formkey;

  static final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  static String email, password;

  set set_ID(String _productID) {
    productID = _productID;
  }

  static Controller get con => _this;

  Future<void> update(BuildContext context, userController user) async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        Firestore.instance.collection("devices").document("$productID").setData({
          "devicename": "   device name",
          "ownerEmail": "${user.email}",
          "ownerID": "${user.uid}",
        });
      } catch (e) {
        print(e.message);
      }
    }
  }
}