import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Home extends StatelessWidget {
  final String user;

  Home(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Home Page',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              child: Text('Log Out'),
              onPressed: _signOut,
            ),
          ],
        ),
      ),
    );
  }

  void _signOut() async{
    await FirebaseAuth.instance.signOut();
  }
}