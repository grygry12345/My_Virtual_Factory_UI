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

  final int id;
  final String name;
  final String password;

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

class Customer {
  Customer({
    this.id,
    this.name,
    this.password,
    this.orders,
  });

  final int id;
  final String name;
  final String password;
  final List<Order> orders;

  Customer copyWith({
    int id,
    String name,
    String password,
    List<Order> orders,
  }) =>
      Customer(
        id: id ?? this.id,
        name: name ?? this.name,
        password: password ?? this.password,
        orders: orders ?? this.orders,
      );

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        password: json["password"],
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "password": password,
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.orderDate,
    this.deadline,
    this.customerId,
    this.orderItem,
  });

  final int id;
  final DateTime orderDate;
  final DateTime deadline;
  final int customerId;
  final List<OrderItem> orderItem;

  Order copyWith({
    int id,
    DateTime orderDate,
    DateTime deadline,
    int customerId,
    List<OrderItem> orderItem,
  }) =>
      Order(
        id: id ?? this.id,
        orderDate: orderDate ?? this.orderDate,
        deadline: deadline ?? this.deadline,
        customerId: customerId ?? this.customerId,
        orderItem: orderItem ?? this.orderItem,
      );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderDate: DateTime.parse(json["orderDate"]),
        deadline: DateTime.parse(json["deadline"]),
        customerId: json["customerId"],
        orderItem: List<OrderItem>.from(
            json["orderItem"].map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderDate":
            "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
        "deadline":
            "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
        "customerId": customerId,
        "orderItem": List<dynamic>.from(orderItem.map((x) => x.toJson())),
      };
}

class OrderItem {
  OrderItem({
    this.id,
    this.amount,
    this.orderId,
    this.productId,
    this.product,
  });

  final int id;
  final String amount;
  final int orderId;
  final String productId;
  final Product product;

  OrderItem copyWith({
    int id,
    String amount,
    int orderId,
    String productId,
    Product product,
  }) =>
      OrderItem(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        orderId: orderId ?? this.orderId,
        productId: productId ?? this.productId,
        product: product ?? this.product,
      );

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        amount: json["amount"],
        orderId: json["orderId"],
        productId: json["productId"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "orderId": orderId,
        "productId": productId,
        "product": product.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.productType,
    this.isSalable,
    this.orderItem,
    this.subProductTree,
    this.schedule,
  });

  final String id;
  final String name;
  final String productType;
  final bool isSalable;
  final List<dynamic> orderItem;
  final List<SubProductTree> subProductTree;
  final List<Schedule> schedule;

  Product copyWith({
    String id,
    String name,
    String productType,
    bool isSalable,
    List<dynamic> orderItem,
    List<SubProductTree> subProductTree,
    List<Schedule> schedule,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        productType: productType ?? this.productType,
        isSalable: isSalable ?? this.isSalable,
        orderItem: orderItem ?? this.orderItem,
        subProductTree: subProductTree ?? this.subProductTree,
        schedule: schedule ?? this.schedule,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        productType: json["productType"],
        isSalable: json["isSalable"],
        orderItem: List<dynamic>.from(json["orderItem"].map((x) => x)),
        subProductTree: List<SubProductTree>.from(
            json["subProductTree"].map((x) => SubProductTree.fromJson(x))),
        schedule: List<Schedule>.from(
            json["schedule"].map((x) => Schedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "productType": productType,
        "isSalable": isSalable,
        "orderItem": List<dynamic>.from(orderItem.map((x) => x)),
        "subProductTree":
            List<dynamic>.from(subProductTree.map((x) => x.toJson())),
        "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
      };
}

class Schedule {
  Schedule({
    this.id,
    this.start,
    this.end,
    this.workCenterId,
    this.workCenter,
    this.productId,
  });

  final int id;
  final int start;
  final int end;
  final int workCenterId;
  final WorkCenter workCenter;
  final String productId;

  Schedule copyWith({
    int id,
    int start,
    int end,
    int workCenterId,
    WorkCenter workCenter,
    String productId,
  }) =>
      Schedule(
        id: id ?? this.id,
        start: start ?? this.start,
        end: end ?? this.end,
        workCenterId: workCenterId ?? this.workCenterId,
        workCenter: workCenter ?? this.workCenter,
        productId: productId ?? this.productId,
      );

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        id: json["id"],
        start: json["start"],
        end: json["end"],
        workCenterId: json["workCenterId"],
        workCenter: WorkCenter.fromJson(json["workCenter"]),
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start": start,
        "end": end,
        "workCenterId": workCenterId,
        "workCenter": workCenter.toJson(),
        "productId": productId,
      };
}

class WorkCenter {
  WorkCenter({
    this.id,
    this.name,
    this.active,
    this.workCenterOperation,
    this.schedule,
  });

  final int id;
  final String name;
  final bool active;
  final List<WorkCenterOperation> workCenterOperation;
  final List<dynamic> schedule;

  WorkCenter copyWith({
    int id,
    String name,
    bool active,
    List<WorkCenterOperation> workCenterOperation,
    List<dynamic> schedule,
  }) =>
      WorkCenter(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
        workCenterOperation: workCenterOperation ?? this.workCenterOperation,
        schedule: schedule ?? this.schedule,
      );

  factory WorkCenter.fromJson(Map<String, dynamic> json) => WorkCenter(
        id: json["id"],
        name: json["name"],
        active: json["active"],
        workCenterOperation: List<WorkCenterOperation>.from(
            json["workCenterOperation"]
                .map((x) => WorkCenterOperation.fromJson(x))),
        schedule: List<dynamic>.from(json["schedule"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
        "workCenterOperation":
            List<dynamic>.from(workCenterOperation.map((x) => x.toJson())),
        "schedule": List<dynamic>.from(schedule.map((x) => x)),
      };
}

class WorkCenterOperation {
  WorkCenterOperation({
    this.id,
    this.speed,
    this.workCenterId,
    this.operationId,
    this.operation,
  });

  final int id;
  final int speed;
  final int workCenterId;
  final int operationId;
  final Operation operation;

  WorkCenterOperation copyWith({
    int id,
    int speed,
    int workCenterId,
    int operationId,
    Operation operation,
  }) =>
      WorkCenterOperation(
        id: id ?? this.id,
        speed: speed ?? this.speed,
        workCenterId: workCenterId ?? this.workCenterId,
        operationId: operationId ?? this.operationId,
        operation: operation ?? this.operation,
      );

  factory WorkCenterOperation.fromJson(Map<String, dynamic> json) =>
      WorkCenterOperation(
        id: json["id"],
        speed: json["speed"],
        workCenterId: json["workCenterId"],
        operationId: json["operationId"],
        operation: Operation.fromJson(json["operation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "speed": speed,
        "workCenterId": workCenterId,
        "operationId": operationId,
        "operation": operation.toJson(),
      };
}

class Operation {
  Operation({
    this.id,
    this.name,
    this.productType,
    this.workCenterOperations,
  });

  final int id;
  final String name;
  final String productType;
  final List<dynamic> workCenterOperations;

  Operation copyWith({
    int id,
    String name,
    String productType,
    List<dynamic> workCenterOperations,
  }) =>
      Operation(
        id: id ?? this.id,
        name: name ?? this.name,
        productType: productType ?? this.productType,
        workCenterOperations: workCenterOperations ?? this.workCenterOperations,
      );

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
        id: json["id"],
        name: json["name"],
        productType: json["productType"],
        workCenterOperations:
            List<dynamic>.from(json["workCenterOperations"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "productType": productType,
        "workCenterOperations":
            List<dynamic>.from(workCenterOperations.map((x) => x)),
      };
}

class SubProductTree {
  SubProductTree({
    this.id,
    this.subproduct,
    this.productId,
    this.amount,
  });

  final int id;
  final String subproduct;
  final String productId;
  final String amount;

  SubProductTree copyWith({
    int id,
    String subproduct,
    String productId,
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
