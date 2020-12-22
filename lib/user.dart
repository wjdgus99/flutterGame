import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_core/firebase_core.dart';

class ApplicationState extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String userName;
  String userEmail;
  String userID;
  String imgurl;
  List<String> chatLog;

  void signInWithGoogle() async {
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await auth.signInWithPopup(googleProvider);
      } else {
        final googleUser = await GoogleSignIn().signIn();
        final googleAuth = await googleUser.authentication;
        final GoogleAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await auth.signInWithCredential(googleAuthCredential);
      }

      final user = userCredential.user;

      //
      // FirebaseFirestore.instance.collection("doc").where().get().then((value) {
      //   for(int i = 0; i < value.docs.length;i++){
      //     romm roomp = new room();
      //     roomp.name = value.docs[i].data()['name'];
      //     buildcard(roomp) // docmentI
      //
      //   }
      //
      //   //class roomp
      //   //TODO: add all of variable in roomp
      //
      //
      // })
      //
      // Widget buildcard (room roomp){
      //   return Consumer<roomp>(
      //     child: sadfa,
      //   )
      // }

      var users = FirebaseFirestore.instance.collection('users');

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((doc) async {
        // 이전에 로그인 한적이 없을 경우만!
        if (!doc.exists) {
          await users.doc(user.uid).set({
            'email': user.email,
            'name': user.displayName,
            'uid': user.uid,
            'userImg': user.photoURL,
          });
        }

        // 이렇게 해야 edit 한 결과를 반영할 수 있음!!
        userName = doc.data()['name'];
        userEmail = doc.data()['email'];
        userID = doc.data()['uid'];
        imgurl = doc.data()['userImg'];
      });

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
    userName = '';
    userEmail = '';
    userID = '';
    notifyListeners();
  }
}
