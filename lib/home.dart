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
  DateTime selectedDate;
  String dateFormat = '';
  final productsTest = ['Apple', 'Banana'];

  String _formatDateDB(DateTime date) {
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

  String _formatDateUX(DateTime date) {
    dateFormat = date.day.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.year.toString() +
        ' ' +
        date.hour.toString() +
        ':' +
        date.minute.toString() +
        ':' +
        date.second.toString();
    return dateFormat;
  }

  List<Product> products;
  getProducts() {
    ApiServices().getAllProducts().then((response) {
      Iterable list = json.decode(response.body);
      List<Product> productList = [];
      productList = list.map((e) => Product.fromJson(e)).toList();
      setState(() {
        products = productList;
      });
    });
  }

  List<Order> orders;
  getOrders() {
    ApiServices().getAllOrders().then((response) {
      Iterable list = json.decode(response.body);
      List<Order> orderList = [];
      orderList = list.map((e) => Order.fromJson(e)).toList();
      setState(() {
        orders = orderList;
      });
    });
  }

  Order order;
  @override
  Widget build(BuildContext context) {
    getOrders();
    getProducts();
    return Scaffold(
        appBar: _buildAppbar(),
        body: orders == null
            ? Center(child: Text('Failed to Fetch Data'))
            : _buildOrders(),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            //_showFormDialog(context);
            await showInfoDialog(context);
          },
          child: Icon(Icons.shopping_basket),
        ));
  }

  Future<void> showInfoDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                title: Text('Give an Order'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            DatePicker.showDateTimePicker(context,
                                showTitleActions: true,
                                onChanged: (date) {}, onConfirm: (date) {
                              selectedDate = date;
                            });
                          },
                          child: Text(
                            'Select Deadline',
                          )),
                      SizedBox(height: 2.0),
                      ElevatedButton(
                        child: Text('Select a Product'),
                        onPressed: () {
                          SelectDialog.showModal<String>(
                            context,
                            label: "Select a Product to Order",
                            showSearchBox: false,
                            selectedValue: selectedProduct,
                            items: products.map((e) => e.name).toList(),
                            onChange: (String selected) {
                              setState(() {
                                selectedProduct = selected;
                              });
                            },
                          );
                        },
                      ),
                      SizedBox(height: 2.0),
                      Text(selectedProduct),
                      SizedBox(height: 2.0),
                      selectedDate == null
                          ? Text('')
                          : Text(_formatDateUX(selectedDate)),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                      onPressed: () {
                        //Navigator.pop(context);
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        if (selectedProduct != '' && selectedDate != null) {
                          Navigator.pop(context);
                          selectedProduct = '';
                          selectedDate = null;

                          setState(() {});
                        } else {}
                      },
                      child: Text('Order'))
                ],
              );
            },
          );
        });
  }

  Widget _buildOrders() {
    return ListView.builder(
      itemCount: orders.length,
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Text('Order ' + orders[index].id.toString()),
            title: Text('Customer ' +
                orders[index].customerId.toString() +
                '\'s Order'),
            subtitle: Text('Order Date: ' +
                _formatDateUX(orders[index].orderDate) +
                '\nOrder Deadline ' +
                _formatDateUX(orders[index].deadline)),
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget _buildAppbar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          semanticLabel: 'menu',
        ),
        onPressed: () {},
      ),
      title: Text('Orders'),
    );
  }
}
