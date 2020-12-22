import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';

class edit extends StatefulWidget {
  @override
  _editState createState() => _editState();
}

class _editState extends State<edit> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(builder: (context, user, child) {
      return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Edit')),
        ),
        body: Text('edit'),
      );
    });
  }
}
