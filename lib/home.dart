import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
//import 'package:wallet/Profile/profile.dart';
import 'package:bluewallet/bluetooth/bluetooth.dart';
//import 'package:bluewallet/Devices/devices.dart'; 
//import 'package:wallet/Settings/settings.dart';

class Home extends StatefulWidget {
  
  Home({
    Key key,
    @required this.user
  }) : super(key: key);

  final FirebaseUser user;
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _index = 0;
  TabController _controller;


  List<String> pages = [
    'Profile',
    'Search',
    'Devices',
    'Settings',
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
        automaticallyImplyLeading: false,         //get rid of this line to go back to login screen
        title: Text('SecureWallet'),
        backgroundColor: Colors.cyan,
      ),
      body: TabBarView(
        controller: _controller,
        children: pages.map((title) {
          switch (title) {
            case 'Profile':
              //return ProfilePage(user: widget.user);
              break;
            
            case 'Search':
              return BluetoothApp();
                                  //(user: widget.user);
              break;

            // case 'Devices':
            //   return DevicePage(user: widget.user);
            //   break;

            case 'Settings':
              //return SettingsPage(user: widget.user);
              break;

            default:
              //return ProfilePage(user: widget.user);
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
            title: Text('Profile'),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.people),
              title: Text('Devices'),
              activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue,
          ),
        ],
      )
    );
  }
}