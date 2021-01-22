import 'package:firebase_authentication/models/brew.dart';
import 'package:firebase_authentication/screens/home/brew_list.dart';
import 'package:firebase_authentication/services/auth.dart';
import 'package:firebase_authentication/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 60,
              ),
              child: Text('Bottom'),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              onPressed: _showSettingsPanel,
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
