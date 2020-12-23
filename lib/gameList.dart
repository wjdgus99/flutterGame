import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'app.dart';

class gameList extends StatefulWidget {
  @override
  _gameListState createState() => _gameListState();
}

class _gameListState extends State<gameList> {

  Query query = FirebaseFirestore.instance.collection('users');



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(PURPLE),
      appBar: AppBar(
        title: Text('Game List'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(NAVY),
        selectedItemColor: Color(GOLD),
        unselectedItemColor: Color(GOLD).withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: 1,
        onTap: (value) {
          if(value == 0){
            Navigator.pushNamed(context, '/profile');
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_headline),
            label: 'ChatRoom',
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: query.snapshots(),
        builder: (context, snapshot){
          return ListView(
              //children: snapshot.map((data) => _buildCards(context, data)).toList()
          );
        },
      ),

    );
  }

  Card _buidCards(BuildContext context, List<DocumentSnapshot> snapshot){
    return Card(

    );
  }
}
