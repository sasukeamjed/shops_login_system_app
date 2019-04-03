import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home_page.dart';
import 'login_page.dart';

class RegisterShopPage extends StatefulWidget {
  @override
  _RegisterShopPageState createState() => _RegisterShopPageState();
}

class _RegisterShopPageState extends State<RegisterShopPage> {
  GlobalKey<FormState> _formKey = GlobalKey();

  String _userEmail, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Register Your Shop',
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
                child: Text('Register'),
                onPressed: _registerNewUser,
              ),
              FlatButton(
                child: Text('Or Login'),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> LogInPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _registerNewUser() async {
    final _formState = _formKey.currentState;
    _formState.save();
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: _userEmail, password: _password);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> LogInPage()));
  }
}
