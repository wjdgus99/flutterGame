import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoomState extends ChangeNotifier {
  //String roomID;
  String roomName;
  Timestamp createTime;
  String creator;
  int gameType;
  int timeLimit;
  int maxCapacity;
  bool status;
  bool isPrivate;
  String keyword;
  int currentUserN;
  List<bool> userPosition;

  CollectionReference room = FirebaseFirestore.instance.collection('rooms');

  //TODO. current UID 필요. (user provider)
  Future<void> makeRoom(String roomName, String creator, int gameType,
      int timeLimit, int maxCapacity, bool isPrivate) async {
    createTime = FieldValue.serverTimestamp() as Timestamp;
    roomName = this.roomName;
    creator = this.creator;
    gameType = this.gameType;
    timeLimit = 10; // TODO. 기본적으로 이만큼 무조건 준다.
    maxCapacity = this.maxCapacity;
    status = false;
    isPrivate = this.isPrivate;
    currentUserN = 1;


    await room.doc(createTime.toString()).set({
      'roomName' : this.roomName,
      'createTime' : createTime,
      'creator' : this.creator,
      'maxCapacity' : this.maxCapacity,
      'currentUserN' : 1,
      'statue' : false,
      'isPrivate' : this.isPrivate,
      'gameType' : this.gameType,
    });

  }
}
