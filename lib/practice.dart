import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user.dart';

class Practice extends StatefulWidget {
  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, user, child ) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                FlatButton(
                    onPressed: () {
                      Provider.of<ApplicationState>(context).signOut();
                    },
                    child: Icon(Icons.exit_to_app)),
              ],
            ),
            body: Column(children: [
              Text('email: ${user.userEmail}'),
              Text('uid: ${user.userID}'),
              Text('name: ${user.userName}'),
            ]));
      },
    );
  }
}
