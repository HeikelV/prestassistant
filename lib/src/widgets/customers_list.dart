import 'package:flutter/material.dart';
import 'package:prestassistant/src/models/customers_model.dart';

class CustomersList extends StatelessWidget {
  final List<Customer> customers;

  const CustomersList(this.customers);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.customers.length,
      itemBuilder: (BuildContext context, int index) {
        return _Customer(customer: this.customers[index], index: index);
      },
    );
  }
}

class _Customer extends StatelessWidget {
  final Customer customer;
  final int index;

  const _Customer({@required this.customer, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_CustomerData(customer), Divider()],
    );
  }
}

class _CustomerData extends StatelessWidget {
  final Customer customer;

  const _CustomerData(this.customer);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${customer.firstname}'),
    );
  }
}
