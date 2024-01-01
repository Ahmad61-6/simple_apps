import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screen/ProductCreateScreen.dart';






void main()
{
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductCreateScreen(),
    );
  }
}
