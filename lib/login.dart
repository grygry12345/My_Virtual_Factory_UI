import 'dart:convert';
import 'package:assignment2/home.dart';
import 'package:assignment2/service.dart';
import 'package:flutter/material.dart';
import 'models.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _adminNameController = TextEditingController();
  final _adminPasswordController = TextEditingController();
  final _userNameController = TextEditingController();
  final _userPasswordController = TextEditingController();

  List<Customer> _customers;
  getCustomers() {
    ApiServices().getAllCustomers().then((response) {
      Iterable list = json.decode(response.body);
      List<Customer> customerList = [];
      customerList = list.map((e) => Customer.fromJson(e)).toList();
      setState(() {
        _customers = customerList;
      });
    });
  }

  List<User> _users;
  getUsers() {
    ApiServices().getAllUsers().then((response) {
      Iterable list = json.decode(response.body);
      List<User> userList = [];
      userList = list.map((e) => User.fromJson(e)).toList();
      setState(() {
        _users = userList;
      });
    });
  }

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
              obscureText: false,
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
                  onPressed: () async {
                    getCustomers();
                    Future.delayed(Duration(milliseconds: 100), () {
                      loginControlCustomer();
                    });
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
                  onPressed: () async {
                    getUsers();
                    Future.delayed(Duration(milliseconds: 100), () {
                      loginControlAdmin();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future loginControlCustomer() async {
    bool isLogin = false;
    bool userFound = false;
    int loggedCustomerId;

    for (var customer in _customers) {
      if (_userNameController.text == customer.name) {
        userFound = true;
        if (_userPasswordController.text == customer.password) {
          isLogin = true;
          loggedCustomerId = customer.id;
          break;
        } else {
          break;
        }
      } else {
        continue;
      }
    }

    if (isLogin == false && userFound == false)
      print('Customer Not Found');
    else if (isLogin == false && userFound == true)
      print('Incorrect Password');
    else {
      print('Login succeed');
      print(loggedCustomerId);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(loggedCustomerId),
          ));
    }
  }

  Future loginControlAdmin() async {
    bool isLogin = false;
    bool userFound = false;

    for (var user in _users) {
      if (_adminNameController.text == user.name) {
        userFound = true;
        if (_adminPasswordController.text == user.password) {
          isLogin = true;
          break;
        } else {
          break;
        }
      } else {
        continue;
      }
    }

    if (isLogin == false && userFound == false)
      print('User Not Found');
    else if (isLogin == false && userFound == true)
      print('Incorrect Password');
    else {
      print('Login succeed');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(0),
          ));
    }
  }
}
