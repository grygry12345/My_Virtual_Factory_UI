import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:assignment2/models.dart';

import 'models.dart';

final String baseUrl = 'https://localhost:44314/api';
LoginModel currentLogin;

class ApiServices {
  Client client = Client();

  //Get all products
  Future getAllProducts() async {
    return await http.get(Uri.parse("$baseUrl/Product"));
  }

  //Get all orders
  Future getAllOrders() async {
    return await http.get(Uri.parse("$baseUrl/Order"));
  }

  Future getAllUsers() async {
    return await http.get(Uri.parse("$baseUrl/User"));
  }

  Future getAllCustomers() async {
    return await http.get(Uri.parse("$baseUrl/Customer"));
  }

  Future getAllOrderItems() async {
    return await http.get(Uri.parse("$baseUrl/OrderItem"));
  }

  void iterateCustomer(String jsonStr) {
    Map<String, dynamic> myMap = json.decode(jsonStr);
    List<dynamic> entitlements = myMap["Dependents"][0]["Entitlements"];
    entitlements.forEach((entitlement) {
      (entitlement as Map<String, dynamic>).forEach((key, value) {
        print(key);
        (value as Map<String, dynamic>).forEach((key2, value2) {
          print(key2);
          print(value2);
        });
      });
    });
  }

  //Create a new Order
  Future<bool> addOrderItem(List<OrderItem> data) async {
    final response = await client.post(
      Uri.parse("$baseUrl/Order"),
      headers: {"content-type": "application/json"},
      body: orderItemToJson(data),
    );
    if (response.statusCode == 201)
      return true;
    else
      return false;
  }

  Map<String, String> header = {
    'Content-Type': 'application/json',
    'accept': 'text/plain'
  };

  Future<bool> postOrder(Order order) async {
    var myOrder = order.toJson();
    var orderBody = json.encode(myOrder);
    var res = await http.post(Uri.parse("$baseUrl/Order"),
        headers: header, body: orderBody);
        print('postorder\n'+res.body);
    return Future.value(res.statusCode == 200 ? true : false);
  }

  Future<bool> postOrderItem(OrderItem orderItem) async {
    var myOrder = orderItem.toJson();
    var orderBody = json.encode(myOrder);
    var res = await http.post(Uri.parse("$baseUrl/OrderItem"),
        headers: header, body: orderBody);
    print('postorderItem\n'+res.body);
    return Future.value(res.statusCode == 200 ? true : false);
  }
}
