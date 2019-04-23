import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bluewallet/userController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// For using PlatformException
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothApp extends StatefulWidget {
  BluetoothApp({Key key, @required this.user})
      : super(key: key);

  final userController user;
  @override
  _BluetoothAppState createState() => _BluetoothAppState();
}

class _BluetoothAppState extends State<BluetoothApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  FlutterBluetoothSerial bluetooth = FlutterBluetoothSerial.instance;

  List<BluetoothDevice> _devicesList = [];
  BluetoothDevice _device;
  bool _connected = false;
  bool _pressed = false;
  bool _access = false;
  List<dynamic> _userDevices = [];
  List<dynamic> _otherAccess = [];
  String _ownerID, _devaddr;
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
  void initState() {
    super.initState();
    bluetoothConnectionState();
  }

  // We are using async callback for using await
  Future<void> bluetoothConnectionState() async {
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      print("Error");
    }
    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case FlutterBluetoothSerial.CONNECTED:
          setState(() {
            _connected = true;
            _pressed = false;
          });
          break;
        case FlutterBluetoothSerial.DISCONNECTED:
          setState(() {
            _connected = false;
            _pressed = false;
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) {
      return;
    }
    setState(() {
      _devicesList = devices;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: linearGradient,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "SECURE DEVICES",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Device:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue
                      ),
                    ),
                    DropdownButton(
                      items: _getDeviceItems(),
                      onChanged: (value) => setState(() => _device = value),
                      value: _device,
                      style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue)
                    ),
                    RaisedButton(
                      onPressed:
                          _pressed ? null : _connected ? _disconnect : _connect,
                      child: Text(_connected ? 'Disconnect' : 'Connect'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: Colors.blue[100],
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        
                        IconButton(
                          icon: Icon(Icons.lock),
                          iconSize: 135.0,
                          color: Colors.red[800],
                          disabledColor: Colors.grey,
                          splashColor: Colors.red[800],
                          onPressed:
                              _connected ? _sendOnMessageToBluetooth : null, 
                        ),
                        IconButton(
                          icon: Icon(Icons.lock_open),
                          iconSize: 135.0,
                          color: Colors.green[800],
                          disabledColor: Colors.grey,
                          splashColor: Colors.green[800],
                          onPressed:
                              _connected ? _sendOffMessageToBluetooth : null, 
                        ),
                        // FlatButton(
                        //   onPressed:
                        //       _connected ? _sendOnMessageToBluetooth : null,
                        //   child: Text("LOCK"),
                        // ),
                        // FlatButton(
                        //   onPressed:
                        //       _connected ? _sendOffMessageToBluetooth : null,
                        //   child: Text("UNLOCK"),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "NOTE: If you cannot find the device in the list, please turn on bluetooth and pair the device by going to the bluetooth settings",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devicesList.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devicesList.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name),
          value: device,
        ));
      });
    }
    return items;
  }
  void _connect() {
    _setOwners();
    if (widget.user.uid.toString() == _ownerID) {
      _access = true;
    }
    if (_device == null) {
      show('No device selected');
    } else {
      widget.user.updateLocation();
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected) {
          bluetooth
              .connect(_device)
              .timeout(Duration(seconds: 10))
              .catchError((error) {
            setState(() => _pressed = false);
          });
          setState(() => _pressed = true);
        }
      });
    }
  }
  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _pressed = true);
  }
  void _sendOnMessageToBluetooth() {
    widget.user.updateLocation();
    _setOwners();
    bluetooth.isConnected.then((isConnected) {
      if (isConnected && _access) {
        bluetooth.write("3");
        show('Your Device is LOCKED');
      }
    });
  }
  void _sendOffMessageToBluetooth() {
    widget.user.updateLocation();
    _setOwners();
    bluetooth.isConnected.then((isConnected) {
      if (isConnected && _access) {
        bluetooth.write("2");
        show('Your Device is UNLOCKED');
      }
    });
  }
  Future show(
    String message, {
    Duration duration: const Duration(seconds: 3),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
        ),
        duration: duration,
      ),
    );
  }
  void _setOwners() {
    _userDevices = widget.user.devices;
    _devaddr = _device.address.toString();
    print("devices doc location being queried is $_devaddr");
    Firestore.instance.collection("devices").document("$_devaddr").get().then((DocumentSnapshot){
        _otherAccess = DocumentSnapshot.data['otheraccess'];
        _ownerID = DocumentSnapshot.data['ownerID'].toString();
    });
    print("setOwners function set ownerID to $_ownerID");
    _ownertodev();
    _ownertoshared();
  }
  void _ownertodev() {
      if (widget.user.uid.toString() == _ownerID) {
        _access=true;
        print("OWNER TO OWN DEVICE");
      }
  }
  void _ownertoshared() {
    String _xdev;
    for (_xdev in _userDevices) 
    {
      if (_xdev.toString() == _devaddr) {
        _access=true;
        print("OWNER TO BORROWED DEVICE");
      }
    }
  }
}