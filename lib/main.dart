import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      home: MyHomePage(),
    );
  }
}

enum AuthMode { SignUp, Login }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthMode _authMode = AuthMode.Login;

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
                    'Or ${_authMode == AuthMode.Login ? 'Register' : 'Login'}'),
                onPressed: () {
                  setState(() {
                    _authMode = _authMode == AuthMode.Login
                        ? AuthMode.SignUp
                        : AuthMode.Login;
                  });
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
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _userEmail, password: _password);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Home()),
      );
    } catch (e) {
      print(e);
    }
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
