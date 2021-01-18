import 'package:firebase_authentication/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({Key key, this.toggleView}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  // Text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text('Sign In'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Form(
            child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  return email = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  return password = value;
                });
              },
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () async {
                WidgetsFlutterBinding.ensureInitialized();
                await Firebase.initializeApp();
                print(email);
                print(password);
              },
              color: Colors.black,
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )),
        // child: RaisedButton(
        //   onPressed: () async {
        //     WidgetsFlutterBinding.ensureInitialized();
        //     await Firebase.initializeApp();
        //     dynamic result = await _auth.signInAnon();
        //     if (result == null) {
        //       print('error signing in');
        //     } else {
        //       print('Signed');
        //       print(result.uid);
        //     }
        //   },
        //   child: Text('Sign In Anon'),
        // ),
      ),
    );
  }
}
