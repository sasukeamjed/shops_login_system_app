import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amber,
        textTheme: Theme.of(context).textTheme.copyWith(
              body1: TextStyle(color: Colors.brown),
            ),
      ),
      home: LogInPage(),
    );
  }
}

Widget _checkUserStatsStream(){
  return StreamBuilder<FirebaseUser>(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, snapshot){
      if(snapshot.hasData){
        print('${snapshot.data}');
        return Home(snapshot.data.email);
      }else{
        print('there is no data');
      }
    },
  );
}

//enum AuthMode { SignUp, Login }




