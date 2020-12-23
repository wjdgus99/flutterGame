import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/user.dart';
import 'package:provider/provider.dart';

import 'app.dart';

class createRoom extends StatefulWidget {
  @override
  _createRoomState createState() => _createRoomState();
}

class _createRoomState extends State<createRoom> {
  String radioButtonItem = 'ONE';
  int gameId = 0;
  int timerId = 1;
  bool _isChecked = false;

  String dropdownValue = '1';
  final TextEditingController _nameTextController = TextEditingController();
  CollectionReference room = FirebaseFirestore.instance.collection('rooms');

  @override
  void dispose() {
    _nameTextController.dispose();
    super.dispose();
  }

  Future<void> makeRoom(String userName) async {

    var createTime =  DateTime.now().toString();


    await room.doc(createTime).set({
      'roomName': _nameTextController.text,
      'createTime': createTime,
      'creator' : userName,
      'maxCapacity': int.parse(dropdownValue),
      'currentUserN': 1,
      'status': false,
      'isPrivate': _isChecked,
      'gameType': gameId,
      //TODO. USERPOSITION
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, user, child) {
        return Scaffold(
            backgroundColor: Color(PURPLE),
            appBar: AppBar(
              title: Text('방 생성'),
              centerTitle: true,
              leading: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
              actions: [
                IconButton(icon: Icon(Icons.check), onPressed: () {
                  print('Creator: ${user.userName}');
                  makeRoom(user.userName);
                  print('DONE!!!!!');
                }),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 70),
              child: Container(
                alignment: Alignment.center,
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.text_fields),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: TextField(
                            controller: _nameTextController,
                            decoration: InputDecoration(
                              hintText: '방 이름',
                              enabledBorder: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.videogame_asset),
                        Radio(
                          value: 0,
                          groupValue: gameId,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'ONE';
                              gameId = 0;
                            });
                          },
                        ),
                        Text(
                          '초성게임',
                          style: TextStyle(fontSize: 17.0),
                        ),
                        Radio(
                          value: 1,
                          groupValue: gameId,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              gameId = 1;
                            });
                          },
                        ),
                        Text(
                          '끝말잇기',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.people),
                        SizedBox(
                          width: 10,
                        ),
                        DropdownButton(
                          value: dropdownValue,
                          items: <DropdownMenuItem>[
                            DropdownMenuItem(
                              value: '1',
                              child: Text('1 명'),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: Text('2 명'),
                            ),
                            DropdownMenuItem(
                              value: '3',
                              child: Text('3 명'),
                            ),
                            DropdownMenuItem(
                              value: '4',
                              child: Text('4 명'),
                            ),
                            DropdownMenuItem(
                              value: '5',
                              child: Text('5 명'),
                            ),
                            DropdownMenuItem(
                              value: '6',
                              child: Text('6 명'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.text_format),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 1,
                                  groupValue: timerId,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItem = 'ONE';
                                      timerId = 1;
                                    });
                                  },
                                ),
                                Text(
                                  '2 글자',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: timerId,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItem = 'TWO';
                                      timerId = 2;
                                    });
                                  },
                                ),
                                Text(
                                  '3 글자',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Radio(
                                  value: 3,
                                  groupValue: timerId,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItem = 'THREE';
                                      timerId = 3;
                                    });
                                  },
                                ),
                                Text(
                                  '4 글자',
                                  style: TextStyle(fontSize: 17.0),
                                ),
                                Radio(
                                  value: 4,
                                  groupValue: timerId,
                                  onChanged: (val) {
                                    setState(() {
                                      radioButtonItem = 'FOUR';
                                      timerId = 4;
                                    });
                                  },
                                ),
                                Text(
                                  '5 글자',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.lock_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('비공개'),
                        ),
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
