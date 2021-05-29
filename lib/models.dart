import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.name,
    this.password,
  });

  int id;
  String name;
  String password;

  User copyWith({
    int id,
    String name,
    String password,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        password: password ?? this.password,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "password": password,
      };
}

List<Customer> customerFromJson(String str) =>
    List<Customer>.from(json.decode(str).map((x) => Customer.fromJson(x)));

String customerToJson(List<Customer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Customer {
  Customer({
    this.id,
    this.name,
    this.password,
  });

  int id;
  String name;
  String password;

  Customer copyWith({
    int id,
    String name,
    String password,
    int orders,
  }) =>
      Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        password: password ?? this.password,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "password": password,
      };
}

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.id,
    this.orderDate,
    this.deadline,
    this.customerId,
  });

  int id;
  DateTime orderDate;
  DateTime deadline;
  int customerId;

  Order copyWith({
    int id,
    DateTime orderDate,
    DateTime deadline,
    int customerId,
    Customer customer,
    int orderItem,
  }) =>
      Order(
        id: id ?? this.id,
        orderDate: orderDate ?? this.orderDate,
        deadline: deadline ?? this.deadline,
        customerId: customerId ?? this.customerId,
      );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderDate: DateTime.parse(json["orderDate"]),
        deadline: DateTime.parse(json["deadline"]),
        customerId: json["customerId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderDate":
            "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "deadline":
            "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
        "customerId": customerId,
      };
}

List<OrderItem> orderItemFromJson(String str) =>
    List<OrderItem>.from(json.decode(str).map((x) => OrderItem.fromJson(x)));

String orderItemToJson(List<OrderItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderItem {
  OrderItem({
    this.id,
    this.amount,
    this.orderId,
    this.productId,
  });

  int id;
  String amount;
  int orderId;
  String productId;

  OrderItem copyWith({
    int id,
    String amount,
    int orderId,
    Order order,
    String productId,
    Product product,
  }) =>
      OrderItem(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        orderId: orderId ?? this.orderId,
        productId: productId ?? this.productId,
      );

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        amount: json["amount"],
        orderId: json["orderId"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "orderId": orderId,
        "productId": productId,
      };
}

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.name,
    this.productType,
    this.isSalable,
  });

  String id;
  String name;
  String productType;
  bool isSalable;

  Product copyWith({
    String id,
    String name,
    String productType,
    bool isSalable,
    List<OrderItem> orderItem,
    List<SubProductTree> subProductTree,
    List<Schedule> schedule,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        productType: productType ?? this.productType,
        isSalable: isSalable ?? this.isSalable,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        productType: json["productType"],
        isSalable: json["isSalable"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "productType": productType,
        "isSalable": isSalable,
      };
}

List<SubProductTree> subProductTreeFromJson(String str) =>
    List<SubProductTree>.from(
        json.decode(str).map((x) => SubProductTree.fromJson(x)));

String subProductTreeToJson(List<SubProductTree> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubProductTree {
  SubProductTree({
    this.id,
    this.subproduct,
    this.productId,
    this.amount,
  });

  int id;
  String subproduct;
  String productId;
  String amount;

  SubProductTree copyWith({
    int id,
    String subproduct,
    String productId,
    Product product,
    String amount,
  }) =>
      SubProductTree(
        id: id ?? this.id,
        subproduct: subproduct ?? this.subproduct,
        productId: productId ?? this.productId,
        amount: amount ?? this.amount,
      );

  factory SubProductTree.fromJson(Map<String, dynamic> json) => SubProductTree(
        id: json["id"],
        subproduct: json["subproduct"],
        productId: json["productId"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subproduct": subproduct,
        "productId": productId,
        "amount": amount,
      };
}

List<Schedule> scheduleFromJson(String str) =>
    List<Schedule>.from(json.decode(str).map((x) => Schedule.fromJson(x)));

String scheduleToJson(List<Schedule> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Schedule {
  Schedule({
    this.id,
    this.start,
    this.end,
    this.workCenterId,
    this.productId,
  });

  int id;
  int start;
  int end;
  int workCenterId;
  String productId;

  Schedule copyWith({
    int id,
    int start,
    int end,
    int workCenterId,
    WorkCenter workCenter,
    String productId,
    Product product,
  }) =>
      Schedule(
        id: id ?? this.id,
        start: start ?? this.start,
        end: end ?? this.end,
        workCenterId: workCenterId ?? this.workCenterId,
        productId: productId ?? this.productId,
      );

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        start: json["start"],
        end: json["end"],
        workCenterId: json["workCenterId"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start": start,
        "end": end,
        "workCenterId": workCenterId,
        "productId": productId,
      };
}

List<WorkCenter> workCenterFromJson(String str) =>
    List<WorkCenter>.from(json.decode(str).map((x) => WorkCenter.fromJson(x)));

String workCenterToJson(List<WorkCenter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkCenter {
  WorkCenter({
    this.id,
    this.name,
    this.active,
  });

  int id;
  String name;
  bool active;

  WorkCenter copyWith({
    int id,
    String name,
    bool active,
    List<WorkCenterOperation> workCenterOperation,
    List<Schedule> schedule,
  }) =>
      WorkCenter(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
      );

  factory WorkCenter.fromJson(Map<String, dynamic> json) => WorkCenter(
        id: json["id"],
        name: json["name"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
      };
}

List<WorkCenterOperation> workCenterOperationFromJson(String str) =>
    List<WorkCenterOperation>.from(
        json.decode(str).map((x) => WorkCenterOperation.fromJson(x)));

String workCenterOperationToJson(List<WorkCenterOperation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkCenterOperation {
  WorkCenterOperation({
    this.id,
    this.speed,
    this.workCenterId,
    this.operationId,
  });

  int id;
  int speed;
  int workCenterId;
  int operationId;

  WorkCenterOperation copyWith({
    int id,
    int speed,
    int workCenterId,
    WorkCenter workCenter,
    int operationId,
    Operation operation,
  }) =>
      WorkCenterOperation(
        id: id ?? this.id,
        speed: speed ?? this.speed,
        workCenterId: workCenterId ?? this.workCenterId,
        operationId: operationId ?? this.operationId,
      );

  factory WorkCenterOperation.fromJson(Map<String, dynamic> json) =>
      WorkCenterOperation(
        id: json["id"],
        speed: json["speed"],
        workCenterId: json["workCenterId"],
        operationId: json["operationId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "speed": speed,
        "workCenterId": workCenterId,
        "operationId": operationId,
      };
}

List<Operation> operationFromJson(String str) =>
    List<Operation>.from(json.decode(str).map((x) => Operation.fromJson(x)));

String operationToJson(List<Operation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Operation {
  Operation({
    this.id,
    this.name,
    this.productType,
  });

  int id;
  String name;
  String productType;

  Operation copyWith({
    int id,
    String name,
    String productType,
  }) =>
      Operation(
        id: id ?? this.id,
        name: name ?? this.name,
        productType: productType ?? this.productType,
      );

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
        id: json["id"],
        name: json["name"],
        productType: json["productType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "productType": productType,
      };
}

class LoginModel {
  LoginModel({this.customer, this.token});

  Customer customer;
  String token;

  LoginModel.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}
