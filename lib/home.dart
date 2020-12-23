import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/user.dart';
import 'package:provider/provider.dart';

import 'app.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8182A7),
      appBar: AppBar(
        title: Text('home'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                Provider.of<ApplicationState>(context).signOut();
                Navigator.pushNamed(context, '/login');
                // Navigator.popAndPushNamed(context, '/login');
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('rooms').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            List<DocumentSnapshot> documents = snapshot.data.docs;
            return GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(15),
              childAspectRatio: 8 / 9,
              children: _buildGridCards(context, documents),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
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
          if (value == 0) {
            Navigator.pushNamed(context, '/profile');
            // Navigator.popAndPushNamed(context, '/profile');
          } else if (value == 2) {
            Navigator.pushNamed(context, '/chatRoom');
            // Navigator.popAndPushNamed(context, '/chatRoom');
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

  List<Card> _buildGridCards(
      BuildContext context, List<DocumentSnapshot> documents) {
    return documents
        .map((docs) => Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 24 / 15,
                      child: Image.network(
                        'https://imgnews.pstatic.net/image/236/2015/01/29/1422519724_1_99_20150129173924.jpg?type=w647',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              docs['roomName'],
                            ),
                          ),
                          Text(docs['currentUserN'].toString() +
                              ' / ' +
                              docs['maxCapacity'].toString()),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 12,
                          ),
                          Text(' ' + docs['creator']),
                        ],
                      ),
                    ),
                    SizedBox(height: 17),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Row(
                        children: [
                          docs['gameType'] == 0
                              ? Expanded(
                                  child: Text(
                                  '초성게임 ',
                                  style: TextStyle(fontSize: 10),
                                ))
                              : Expanded(
                                  child: Text('끝말잇기 ',
                                      style: TextStyle(fontSize: 10))),
                          docs['status']
                              ? Text('(게임 중)', style: TextStyle(fontSize: 10))
                              : Text('(준비 중)', style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }
}
