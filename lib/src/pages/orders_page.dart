import 'package:flutter/material.dart';
import 'package:prestassistant/src/services/orders_services.dart';
import 'package:prestassistant/src/widgets/orders_list.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final orderService = Provider.of<OrdersService>(context);

    // OrdersList(orderService.orders)
    return SafeArea(
      child: Scaffold(body: (orderService.orders.length == 0) ? Center(child: CircularProgressIndicator()) : OrdersList(orderService.orders)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
