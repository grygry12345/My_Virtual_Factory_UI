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

import 'dart:convert';

import 'package:assignment2/models.dart';
import 'package:assignment2/service.dart';
import 'package:flutter/material.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedProduct = '';
  String selectedDate = '';
  String dateFormat = '';
  final productsTest = ['Apple', 'Banana'];
  ApiServices _apiService = ApiServices();

  String _formatDate(DateTime date) {
    dateFormat = date.year.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.day.toString() +
        'T' +
        date.hour.toString() +
        ':' +
        date.minute.toString() +
        ':' +
        date.second.toString();
    return dateFormat;
  }

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    if (selectedProduct != '' && selectedDate != '') {
                      //orders.add({selectedProduct: selectedDate});
                      Navigator.pop(context);
                      selectedProduct = '';
                      selectedDate = '';
                      setState(() {});
                    } else {}
                  },
                  child: Text('Order'))
            ],
            title: Text('Give an Order'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ElevatedButton(
                    child: Text('Select a Product'),
                    onPressed: () {
                      //_showListDialog(products);
                    },
                  ),
                  SizedBox(height: 2.0),
                  ElevatedButton(
                      onPressed: () {
                        DatePicker.showDateTimePicker(context,
                            showTitleActions: true,
                            onChanged: (date) {}, onConfirm: (date) {
                          print('confirm $date');
                          selectedDate = _formatDate(date);
                        }, currentTime: DateTime.now());
                      },
                      child: Text(
                        'Select Deadline',
                      )),
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
        /*body: ListView.builder(
          //itemCount: orders.length,
          itemCount: product.length,
          padding: EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                //title: Text(orders[index].keys.toString()),
                //leading: Text(orders[index].values.toString()),
                //TODO: Show orders instead of products
                //TODO: Show products in SelectDialog section
                title: Text(product[index].name),
              ),
            );
          },
        ),*/
        body: SafeArea(
          child: FutureBuilder(
            future: _apiService.getAllProducts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                      "Something wrong with message: ${snapshot.error.toString()}"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                // Called when the future is resolved (i.e: when the result is returned from the server)
                List<Product> products = snapshot.data;
                return _buildListView(products);
              } else {
                return Center(
                  child:
                      CircularProgressIndicator(), // Loading with the request is being processed
                );
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showFormDialog(context);
            dateFormat = _formatDate(DateTime.now());
            print(dateFormat);
          },
          child: Icon(Icons.shopping_basket),
        ));
  }

  Widget _buildListView(List<Product> products) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          return Card(
            child: ListTile(
              title: Text(product.name.toString()),
              leading: Text(product.productType.toString()),
              //TODO: Show orders instead of products
              //TODO: Show products in SelectDialog section
            ),
          );
        },
      ),
    );
  }

  Future<String> _showListDialog(List<Product> products) {
    return SelectDialog.showModal<String>(
      context,
      label: "Select a Product to Order",
      showSearchBox: false,
      selectedValue: selectedProduct,
      //items: products,
      onChange: (String selected) {
        setState(() {
          selectedProduct = selected;
        });
      },
    );
  }
}
