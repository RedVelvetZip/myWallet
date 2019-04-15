// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';

// class Device {
//   Device({
//     Key key,
//     @required this.owner,
//     @required this.nickname,
//     @required this.owneremail,
//     @required this.deviceid,
//     @required this.user
//     });

//   final String owner;
//   final String nickname;
//   final String owneremail;
//   final String deviceid;
//   final FirebaseUser user;

//   static List<Device> allFromResponse(String response) {
//     return snapshot.data.documents
//     .map((document) => new Text(document['some_field']).toList()

//     return 
//     db = FirebaseDatabase.instance.reference().child("users");
//     db.once().then((DataSnapshot snapshot){
//     Map<dynamic, dynamic> values = snapshot.value;
//        values.forEach((key,values) {
//         print(values["name"]);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//   return StreamBuilder<QuerySnapshot>(
//     stream: Firestore.instance.collection(name).snapshots(),
//     builder: (BuildContext context, 
//               AsyncSnapshot<QuerySnapshot> snapshot) {
//       return new ListView(children: createChildren(snapshot));
//     },
//   );
// }
    


//   static List<Device> allFromUser(snapshot) {
//     var decodedJson = json.decode(snapshot).cast<String, dynamic>();

//     return decodedJson['results']
//         .cast<Map<String, dynamic>>()
//         .map((obj) => Device.fromMap(obj))
//         .toList()
//         .cast<Device>();
//   }

//   static Device fromMap(Map map) {
//     var nickname = map[''];

//     // return new Device(
//     //   owner: '${owner}',
//     //   nickname: '${ownername}',
//     //   owneremail: map['email'],
//     //   deviceid: map['deviceid'],
//     // );
//   }
// }