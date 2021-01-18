import 'package:firebase_authentication/models/user.dart';
import 'package:firebase_authentication/screens/authenticate/authenticate.dart';
import 'package:firebase_authentication/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    print(user);
    return Authenticate();
  }
}
