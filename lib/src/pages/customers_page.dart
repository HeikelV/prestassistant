import 'package:flutter/material.dart';
import 'package:prestassistant/src/services/customers_services.dart';
import 'package:prestassistant/src/widgets/customers_list.dart';
import 'package:provider/provider.dart';

class CustomersPage extends StatefulWidget {
  @override
  _CustomersPageState createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final customersService = Provider.of<CustomersService>(context);

    // OrdersList(orderService.orders)
    return SafeArea(
      child: Scaffold(body: (customersService.customers.length == 0) ? Center(child: CircularProgressIndicator()) : CustomersList(customersService.customers)),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
