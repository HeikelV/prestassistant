import 'package:flutter/material.dart';
import 'package:prestassistant/src/models/orders_models.dart';
import 'package:prestassistant/src/theme/tema.dart';
import 'package:intl/intl.dart';

final formatCurrency = new NumberFormat.simpleCurrency();

class OrdersList extends StatelessWidget {
  final List<Order> orders;

  const OrdersList(this.orders);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.orders.length,
      itemBuilder: (BuildContext context, int index) {
        return _Order(order: this.orders[index], index: index);
      },
    );
  }
}

class _Order extends StatelessWidget {
  final Order order;
  final int index;

  const _Order({@required this.order, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_OrderTopBar(order, index), _OrderData(order), Divider()],
    );
  }
}

class _OrderData extends StatelessWidget {
  final Order order;

  const _OrderData(this.order);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('${order.payment.toString().split(".").last}'),
    );
  }
}

class _OrderTopBar extends StatelessWidget {
  final Order order;
  final int index;

  const _OrderTopBar(this.order, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}. ',
            style: TextStyle(color: miTema.accentColor),
          ),
          Text('${order.reference}   '),
          Text('${formatCurrency.format(double.parse(order.totalPaid))}'),
          // Text('${formatCurrency.format(order.totalPaid)}')
        ],
      ),
    );
  }
}
