import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prestassistant/src/pages/initial_setting.dart';
import 'package:prestassistant/src/pages/onboarding_page.dart';
import 'package:prestassistant/src/services/customers_services.dart';
import 'package:prestassistant/src/services/orders_services.dart';
import 'package:prestassistant/src/shared_prefs/prefs_user.dart';
import 'package:prestassistant/src/theme/tema.dart';
import 'package:provider/provider.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PrefsUser();
  await prefs.initPrefs();
  initScreen = prefs.initScreen;
  prefs.initScreen = 1;
  print(prefs.key);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new OrdersService()),
        ChangeNotifierProvider(create: (_) => new CustomersService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: initScreen == 0 || initScreen == null ? OnBoardingPage() : InitialSetting(),
      ),
    );
  }
}
