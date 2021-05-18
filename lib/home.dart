// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final products = ['Coffee', 'Milk', 'Chocolate', 'Banana'];
  final _orderNameController = TextEditingController();
  final _orderDeadlineController = TextEditingController();
  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _orderNameController.clear();
                    _orderDeadlineController.clear();
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    products.add(_orderNameController.text);
                    _orderNameController.clear();
                    _orderDeadlineController.clear();
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Text('Order'))
            ],
            title: Text('Add Product'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _orderNameController,
                    decoration: InputDecoration(
                        labelText: 'Product',
                        hintText: 'Enter a Product to Order'),
                  ),
                  TextField(
                    controller: _orderDeadlineController,
                    decoration: InputDecoration(
                        labelText: 'Deadline',
                        hintText: 'Enter the Deadline of the Order'),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: () {},
          ),
          title: Text('Your Orders'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          padding: EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(products[index]),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showFormDialog(context);
          },
          child: Icon(Icons.shopping_basket),
        ));
  }
}
