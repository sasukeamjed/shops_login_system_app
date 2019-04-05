import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';


class Home extends StatelessWidget {
  final String user;

  Home(this.user);

  @override
  Widget build(BuildContext context) {
    print('Home Page is build +++++++++++++++++');
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
              onPressed: (){
                _signOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _signOut(BuildContext context) async{
    await FirebaseAuth.instance.signOut();
//    Navigator.pushReplacement(
//      context,
//      MaterialPageRoute(builder: (BuildContext context) => LogInPage()),
//    );
  }
}