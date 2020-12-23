import 'package:flutter/material.dart';

import 'app.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(PURPLE),
      appBar: AppBar(
        title: Text('home'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.pushNamed(context, '/createRoom');
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Color(GOLD),
        ),
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
    );
  }
}