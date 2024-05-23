import 'package:flutter/material.dart';
import 'package:hsi_alg/pages/intro_Page.dart';
import 'package:hsi_alg/pages/menu_page.dart';
import 'package:provider/provider.dart';

import 'models/task_have.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => TaskHave(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/menupage':(context) => const MenuPage(),
        '/intropage': (context) => const IntroPage(),
      },
    );
  }
}
