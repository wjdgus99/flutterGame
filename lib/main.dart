import 'package:flutter/material.dart';
import 'package:flutter_game/user.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      child: gameApp(),
    ),
  );
}
