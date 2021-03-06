import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prestassistant/src/models/orders_models.dart';
import 'package:http/http.dart' as http;
import 'package:prestassistant/src/shared_prefs/prefs_user.dart';

final prefs = new PrefsUser();

// const _API_KEY = '4T31U7Q2XZYKAAW353IATQXL9K4Q3K5U';
// const _PRESTAXHOP_URL = 'https://958d30e30cfb.ngrok.io/prestashop';
// String _token = base64.encode(utf8.encode(_API_KEY + ':'));

final String _url = prefs.uri;
final String _token = prefs.token;

class OrdersService with ChangeNotifier {
  List<Order> orders = [];

  OrdersService() {
    this.getOrders();
  }

  getOrders() async {
    final url = Uri.parse('$_url/api/orders?display=[id,date_add,payment,total_paid,reference]&output_format=JSON');

    final resp = await http.get(url, headers: {HttpHeaders.authorizationHeader: "Basic $_token"});
    print(resp.statusCode);

    final ordersResponse = ordersReponseFromJson(resp.body);
    this.orders.addAll(ordersResponse.orders);
    notifyListeners();
  }
}
