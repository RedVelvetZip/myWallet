import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:bluewallet/Profile/View/profile.dart';
import 'package:bluewallet/prop-config.dart';
import 'package:bluewallet/analyticsController.dart';
import 'package:bluewallet/userController.dart';
import 'package:bluewallet/bluetooth/bluetooth.dart';
import 'package:bluewallet/Devices/devices.dart';

class Home extends StatefulWidget {

  Home({
    Key key,
    this.analControl,
    @required this.user,
  }) : super(key: key);

  final userController user;
  final analyticsController analControl;
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  int _index = 0;
  TabController _controller;

  List<String> pages = [
    Headers.profile,
    Headers.newdevice,
    Headers.devices,
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(
        vsync: this,
        length: pages.length,
        initialIndex: _index
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Secure Wallet'),
        backgroundColor: Colors.red,
      ),
      body: TabBarView(
        controller: _controller,
        children: pages.map((title) {
          switch (title) {
            case Headers.profile:
              widget.analControl.sendAnalytics('nav_to_profile');
              return ProfilePage(user: widget.user, analControl: widget.analControl);
              break;
            
            case Headers.newdevice:
              widget.analControl.sendAnalytics('nav_to_messages');
              return BluetoothApp(user: widget.user);
              break;

             case Headers.devices:
              widget.analControl.sendAnalytics('nav_to_buddies');
              return DevicePage(user: widget.user);
              break;

            default:
              return ProfilePage(user: widget.user, analControl: widget.analControl);
              break;
          }
        }).toList(),
      ),
      bottomNavigationBar: BottomNavyBar(
        onItemSelected: (index) => setState(() {
            _index = index;
            _controller.animateTo(_index);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.portrait),
            title: Text(Headers.profile),
            activeColor: Colors.purple,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.bluetooth_searching),
              title: Text('Connect'),
              activeColor: Colors.purple,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.list),
              title: Text("Settings"),
              activeColor: Colors.purple,
          ),
        ],
      )
    );
  }
}