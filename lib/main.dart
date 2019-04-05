import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';
import 'home_page.dart';
import 'models/user_model.dart';

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
      home: _checkUserStatsStream(),
    );
  }
}

Widget _checkUserStatsStream(){
  print('+++++++++ _checkUserStatsStream Function is used ++++++++++++++++');
  return StreamBuilder<FirebaseUser>(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context, snapshot){
      if(snapshot.hasData){
        print('++++++++++++++++ there is data +++++++++++++++++++++++');
        print('${snapshot.data}');
        User user = User(uid: snapshot.data.uid, email: snapshot.data.email);
        print(user.uid);
        print(user.email);
        return Home(snapshot.data.email);
      }else{
        print('---------------- there is no data -------------');
        return LogInPage();
      }
    },
  );
}

//enum AuthMode { SignUp, Login }




