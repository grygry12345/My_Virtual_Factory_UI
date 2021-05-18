import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _adminNameController = TextEditingController();
  final _adminPasswordController = TextEditingController();
  final _userNameController = TextEditingController();
  final _userPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Text('AUTOMATION SYSTEM'),
              ],
            ),
            SizedBox(height: 120.0),
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Customer Name',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _userPasswordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    _userNameController.clear();
                    _userPasswordController.clear();
                  },
                ),
                ElevatedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            TextField(
              controller: _adminNameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Admin Name',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _adminPasswordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                TextButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    _adminNameController.clear();
                    _adminPasswordController.clear();
                  },
                ),
                ElevatedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
