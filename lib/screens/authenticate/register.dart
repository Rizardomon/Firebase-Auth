import 'package:firebase_authentication/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({Key key, this.toggleView}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0,
        title: Text('Register'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
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
                'Register',
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
