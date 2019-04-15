import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class MyDevicesPage extends StatefulWidget {

  MyDevicesPage({
    Key key,
    @required this.user
  }) : super(key: key);

  final FirebaseUser user;

  @override
  _MyDevicesPageState createState() => _MyDevicesPageState();
}

class _MyDevicesPageState extends State<MyDevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
                  new StreamBuilder<Event>(
                    stream: FirebaseDatabase.instance
                        .reference()
                        .child('users')
                        .child(widget.user.uid)
                        .onValue,
                    builder:
                        (BuildContext context, AsyncSnapshot<Event> event) {
                      if (!event.hasData)
                        return new Center(child: new Text('Loading...'));
                      Map<dynamic, dynamic> data = event.data.snapshot.value;
                      return Column(children: [
                        new Text('${data['name']}',
                            style: new TextStyle(fontSize: 30.0)),
                        new Text('-${data['email']}')

                      ]);
                    },
                  ),
                ],
      )
    );
  }
}