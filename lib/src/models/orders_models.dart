// To parse this JSON data, do
//
//     final ordersReponse = ordersReponseFromJson(jsonString);

import 'dart:convert';

OrdersReponse ordersReponseFromJson(String str) =>
    OrdersReponse.fromJson(json.decode(str));

String ordersReponseToJson(OrdersReponse data) => json.encode(data.toJson());

class OrdersReponse {
  OrdersReponse({
    this.orders,
  });

  List<Order> orders;

  factory OrdersReponse.fromJson(Map<String, dynamic> json) => OrdersReponse(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    this.id,
    this.dateAdd,
    this.payment,
    this.totalPaid,
    this.reference,
  });

  int id;
  DateTime dateAdd;
  Payment payment;
  String totalPaid;
  String reference;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        dateAdd: DateTime.parse(json["date_add"]),
        payment: paymentValues.map[json["payment"]],
        totalPaid: json["total_paid"],
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_add": dateAdd.toIso8601String(),
        "payment": paymentValues.reverse[payment],
        "total_paid": totalPaid,
        "reference": reference,
      };
}

enum Payment { PAYMENT_BY_CHECK, BANK_WIRE, PAYMENTS_BY_CHECK, MESH_PAYMENT }

final paymentValues = EnumValues({
  "Bank wire": Payment.BANK_WIRE,
  "Mesh Payment": Payment.MESH_PAYMENT,
  "Payments by check": Payment.PAYMENTS_BY_CHECK,
  "Payment by check": Payment.PAYMENT_BY_CHECK
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
