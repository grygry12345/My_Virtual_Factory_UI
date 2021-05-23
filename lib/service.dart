import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:http/http.dart' as http;
import 'package:assignment2/models.dart';

class ApiServices {
  final String baseUrl = 'https://localhost:44314/api';
  Client client = Client();

  //Get all products
  Future getAllProducts() async {
    return await http.get(Uri.parse("$baseUrl/Product"));
  }

  //Get all orders
  Future getAllOrders() async {
    return await http.get(Uri.parse("$baseUrl/Order"));
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
    return Future.value(res.statusCode == 200 ? true : false);
  }
}
