import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        appBar: AppBar(),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
