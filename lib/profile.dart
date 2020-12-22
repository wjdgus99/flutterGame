import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import 'app.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
      builder: (context, user, child) {
        return Scaffold(
          backgroundColor: Color(PURPLE),
          appBar: AppBar(
            title: Text('My'),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit');
                  })
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  imageProfile(user.imgurl),
                  SizedBox(
                    height: 20,
                  ),
                  Text('${user.userName}'),
                  SizedBox(
                    height: 40,
                  ),
                  Align(alignment: Alignment.centerLeft, child: Text('Email')),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('${user.userEmail}')),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color(NAVY),
            selectedItemColor: Color(GOLD),
            unselectedItemColor: Color(GOLD).withOpacity(.60),
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (value) {
              if (value == 1) {
                Navigator.pushNamed(context, '/home');
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
      },
    );
  }

  Widget imageProfile(String url) {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(url),
          )
        ],
      ),
    );
  }
}
