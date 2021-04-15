import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prestassistant/src/pages/onboarding_page.dart';
import 'package:prestassistant/src/pages/tabs_page.dart';
import 'package:prestassistant/src/services/orders_services.dart';
import 'package:prestassistant/src/theme/tema.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print(initScreen);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new OrdersService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: initScreen == 0 || initScreen == null ? OnBoardingPage() : TabPage(),
      ),
    );
  }
}
