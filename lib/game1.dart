import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'app.dart';

class cGamePage extends StatefulWidget {
  @override
  _cGamePageState createState() => _cGamePageState();
}

class _cGamePageState extends State<cGamePage> {
  //TODO: Change this to the argument.
  var roomName = 'DefaultRoom1';
  var roomDocument = FirebaseFirestore.instance.collection('rooms');

  TextEditingController submitAnswer = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // roomName = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(PURPLE),
      appBar: AppBar(
        title: Text("Lee, Inseok's room"),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: roomDocument.doc(roomName).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [user(0), user(1), user(2)],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 200,
                    child: Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Text(snapshot.data['keyword']),
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 30,
                                  child: TextField(
                                    controller: submitAnswer,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [showRecentlyChat()],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            children: [
                              for (var re in snapshot.data['answers'])
                                Container(
                                  child: Text(re),
                                )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: FlatButton(
                      onPressed: () {
                        print('flat');
                      },
                      child: Text('Save'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [user(3), user(4), user(5)],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget showAnswers(DocumentSnapshot snapshot) {}

  Widget user(int position) {
    return StreamBuilder<QuerySnapshot>(
      stream: roomDocument
          .doc(roomName)
          .collection('currentPlayer')
          .where('position', isEqualTo: position)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.data.docs.isNotEmpty) {
          return Card(
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 70,
                  child: Image.network(
                      snapshot.data.docs.elementAt(0).data()['userImg']),
                ),
                SizedBox(
                  width: 100,
                  height: 30,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(snapshot.data.docs.elementAt(0).data()['user']),
                  ),
                )
              ],
            ),
          );
        }

        return Card(
            child: Column(
          children: [
            SizedBox(
              width: 100,
              height: 70,
              child: Image(image: AssetImage('images/defaultImage.png')),
            ),
            SizedBox(
              width: 100,
              height: 30,
              child: Container(
                alignment: Alignment.center,
                child: Text('default name'),
              ),
            )
          ],
        ));
      },
    );
  }

  Widget showRecentlyChat() {
    return StreamBuilder(
        stream: roomDocument
            .doc(roomName)
            .collection('chats')
            .orderBy('timestamp', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return ListView(
            shrinkWrap: true,
            children:
                snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
              DateTime messageTime =
                  documentSnapshot.data()['timestamp'].toDate();

              var MessageT = '[' +
                  messageTime.hour.toString() +
                  ':' +
                  messageTime.hour.toString() +
                  ':' +
                  messageTime.hour.toString() +
                  '] ';

              return Container(
                padding: EdgeInsets.all(4.0),
                child: Text(MessageT +
                    documentSnapshot.data()['userName'] +
                    '-' +
                    documentSnapshot.data()['text']),
              );
            }).toList(),
          );
        });
  }
}
