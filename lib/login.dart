import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/app.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'user.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(builder: (context, user, child) {
      return Scaffold(
        backgroundColor: Color(PURPLE),
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 0, 60),
                  child: Container(
                    child: Image(image: AssetImage('images/game_logo.png',),width: 130,height: 130,),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SignInButton(
                    Buttons.Google,
                    text: 'Sign in with Google',
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    onPressed: () async {
                      Provider.of<ApplicationState>(context).signInWithGoogle();
                      await Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
              ],
            )),
      );
    });
  }
}
