import 'package:flutter/material.dart';
import 'package:flutter_game/edit.dart';
import 'package:flutter_game/ppp.dart';
import 'package:flutter_game/practice.dart';
import 'package:flutter_game/profile.dart';
import 'package:flutter_game/splash.dart';
import 'edit.dart';
import 'home.dart';
import 'login.dart';
import 'ppp.dart';

final GOLD = 0xFFE4C77A;
final NAVY = 0xFF343A75;
final PURPLE = 0xFF8182A7;

class gameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(NAVY),
        backgroundColor: Color(PURPLE),
        accentColor: Color(0xFF343A75),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryTextTheme: TextTheme(
            // ignore: deprecated_member_use
            title: TextStyle(color: Color(GOLD))),
        buttonTheme: ButtonThemeData(
            //buttonColor: Color(0xFFE0BD64)
            ),
        primaryIconTheme: IconThemeData(color: Color(GOLD)),
      ),
      title: 'Game Demo',
      home: ppp(),
      initialRoute: '/ppp',
      routes: {
        '/profile': (context) => profile(),
        '/practice': (context) => Practice(),
        '/login': (context) => login(),
        '/splash': (context) => SplashPage(),
        '/home': (context) => home(),
        '/edit': (context) => edit(),
        '/ppp' : (context) => ppp(),
      },
    );
  }
}
