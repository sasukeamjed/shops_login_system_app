import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';
import 'register_shop.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
//  AuthMode _authMode = AuthMode.Login;

  GlobalKey<FormState> _formKey = GlobalKey();

  String _userEmail, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login into Your Shop',
          style: TextStyle(color: Theme.of(context).textTheme.body1.color),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(15),
                      child: TextFormField(
                        onSaved: (String value) {
                          _userEmail = value;
                        },
                        decoration: InputDecoration(
                            labelText: 'Shop Name',
                            icon: Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Icon(
                                Icons.person,
                              ),
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(15),
                      child: TextFormField(
                        onSaved: (String value) {
                          _password = value;
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            icon: Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Icon(
                                Icons.lock,
                              ),
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: _logIn,
              ),
              FlatButton(
                child: Text(
                    'Or Register'),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> RegisterShopPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logIn() async {
    final _formState = _formKey.currentState;
    _formState.save();
    try {
      FirebaseUser user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _userEmail, password: _password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Home(user.email)),
      );
    } catch (e) {
      print(e.message);
    }
  }
}