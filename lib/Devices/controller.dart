import 'package:flutter/material.dart';
import 'package:bluewallet/prop-config.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bluewallet/userController.dart';

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

  //add user access BEGIN
  List _interests;
  static String _newInterest;
  static TextEditingController _textController = TextEditingController();

  TextEditingController get textController => _textController;
  List get interests => _interests;
  String get newInterest => _newInterest;

  set set_interests(List __interests){
    _interests = __interests;
  }

  void setTextListener() {
    _textController.addListener(onChange);
  }

  void onChange() async {
    _newInterest = _textController.text;
  }
  
  Future<void> addInterest(userController user) async {
    if (_newInterest != null && _newInterest != "") {
      List temp = List.from(_interests);
      temp.add(_newInterest);
      _interests = temp;
      Firestore.instance.collection("users")
        .document("${user.uid}")
        .updateData({"interests": FieldValue.arrayUnion(["$_newInterest"])});
    }
  }

  Future<void> deleteInterest(userController user, String interest) async {
    print("Removing $interest");
    List temp = List.from(_interests);
    temp.remove(interest);
    _interests = temp;
    Firestore.instance.collection("users")
        .document("${user.uid}")
        .updateData({"interests": FieldValue.arrayRemove(["$interest"])});
  }

  String validateInterest(String value) {
    RegExp regExp = new RegExp(Pattern.characters);
    if (value.length == 0) {
      return Requirements.name;
    } else if (!regExp.hasMatch(value)) {
      return Requirements.range;
    }
    return null;
  }


  //add user access END



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