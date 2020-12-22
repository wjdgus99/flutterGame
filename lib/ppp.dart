import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';


class ppp extends StatefulWidget{
  @override
  _pppState createState() => _pppState();
}

class _pppState extends State<ppp> {
  final FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(),
      body: Text('dsfd'),
    );
  }
}