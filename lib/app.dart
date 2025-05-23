import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_apps/presentation/ui/screens/get_started_screen.dart';

import 'controller_binders.dart';

class GroceryShopApp extends StatelessWidget {
  const GroceryShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetStartedScreen(),
      initialBinding: ControllerBinders(),
    );
  }
}
