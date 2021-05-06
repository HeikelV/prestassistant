// To parse this JSON data, do
//
//     final customersResponse = customersResponseFromJson(jsonString);

import 'dart:convert';

CustomersResponse customersResponseFromJson(String str) => CustomersResponse.fromJson(json.decode(str));

String customersResponseToJson(CustomersResponse data) => json.encode(data.toJson());

class CustomersResponse {
  CustomersResponse({
    this.customers,
  });

  List<Customer> customers;

  factory CustomersResponse.fromJson(Map<String, dynamic> json) => CustomersResponse(
        customers: List<Customer>.from(json["customers"].map((x) => Customer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
      };
}

class Customer {
  Customer({
    this.id,
    this.lastname,
    this.firstname,
  });

  int id;
  String lastname;
  String firstname;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        lastname: json["lastname"],
        firstname: json["firstname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lastname": lastname,
        "firstname": firstname,
      };
}
