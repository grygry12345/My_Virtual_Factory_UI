import 'package:http/http.dart' show Client;
import 'package:assignment2/models.dart';

class ApiServices {
  final String baseUrl = 'https://localhost:44314/api';
  Client client = Client();

  //Get all products
  Future<List<Product>> getAllProducts() async {
    final response = await client.get(Uri.parse("$baseUrl/Product"));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return null;
    }
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

  //Get all Orders
  Future<List<Order>> getAllOrders() async {
    final response = await client.get(Uri.parse("$baseUrl/Order"));
    if (response.statusCode == 200) {
      return orderFromJson(response.body);
    } else {
      return null;
    }
  }
}
