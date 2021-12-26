import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './screen/screen.dart';
import 'get_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: const NavScreen(),
    );
  }
}
