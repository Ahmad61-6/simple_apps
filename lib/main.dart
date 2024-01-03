import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_apps/Screen/ProductGridViewScreen.dart';

import 'Screen/ProductCreateScreen.dart';






void main()
{
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductGridViewScreen(),
    );
  }
}
