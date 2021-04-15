import 'package:flutter/material.dart';
import 'package:prestassistant/src/pages/orders_page.dart';
import 'package:provider/provider.dart';

class TabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: 'Orders'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Customers'),
        BottomNavigationBarItem(icon: Icon(Icons.local_mall_outlined), label: 'Products'),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(controller: navegacionModel.pageController, physics: NeverScrollableScrollPhysics(), children: <Widget>[
      Container(
        color: Colors.red,
        child: Center(
          child: Text('POCHA'),
        ),
      ),
      OrdersPage(),
      Container(
        color: Colors.purple,
        child: Center(
          child: Text('TE'),
        ),
      ),
      Container(
        color: Colors.pink,
        child: Center(
          child: Text('QUIERO'),
        ),
      ),
    ]);
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();
  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
