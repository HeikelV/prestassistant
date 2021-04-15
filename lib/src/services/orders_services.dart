import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prestassistant/src/models/orders_models.dart';
import 'package:http/http.dart' as http;

const _API_KEY = '4T31U7Q2XZYKAAW353IATQXL9K4Q3K5U';
const _PRESTAXHOP_URL = 'https://0fc032fd279f.ngrok.io/prestashop/api';

String _token = base64.encode(utf8.encode(_API_KEY + ':'));

class OrdersService with ChangeNotifier {
  List<Order> orders = [];

  OrdersService() {
    this.getOrders();
  }

  getOrders() async {
    final url = Uri.parse('$_PRESTAXHOP_URL/orders?display=[id,date_add,payment,total_paid,reference]&output_format=JSON');

    print(url);
    print(_token);

    final resp = await http.get(url, headers: {HttpHeaders.authorizationHeader: "Basic $_token"});
    print(resp.statusCode);

    final ordersResponse = ordersReponseFromJson(resp.body);
    this.orders.addAll(ordersResponse.orders);
    notifyListeners();
  }
}
